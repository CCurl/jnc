/* Chris Curl, MIT license. */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SYMBOLS_SZ   1000
#define CODE_SZ     10000
#define HEAP_SZ     10000

#define BTWI(n,l,h) ((l<=n)&&(n<=h))
#define BCASE break; case

typedef struct { char type, name[23], asm_name[8], *strVal; int sz; } SYM_T;
typedef struct { int op, a1, a2; char *s1, *s2; } INST_T;

// Tokens - NOTE: the first 8 must match the words list in tc.c
enum {
    NO_TOK, ELSE_TOK, IF_TOK, WHILE_TOK, VOID_TOK, INT_TOK, CHAR_TOK, RET_TOK
    , TOK_THEN, TOK_END, TOK_BEGIN, TOK_UNTIL, TOK_AGAIN, TOK_DEF
    , TOK_LBRA, TOK_RBRA, TOK_LPAR, TOK_RPAR, TOK_LARR, TOK_RARR, TOK_COMMA
    , TOK_PLUS, TOK_MINUS, TOK_STAR, TOK_SLASH, TOK_INC, TOK_DEC, TOK_PLEQ
    , TOK_LT, TOK_EQ, TOK_GT, TOK_NEQ
    , TOK_SET, TOK_NUM, TOK_ID, TOK_FUNC, TOK_STR, TOK_REG
    , TOK_OR, TOK_AND, TOK_XOR, TOK_LOR, TOK_LAND
    , TOK_SEMI, EOI
};

// NOTE: these have to be in sync with the first <x> entries in the list of tokens
char *words[] = { "", "else", "if" , "while", "void", "int", "char" , "return",
    "then", "end", "begin", "until", "again", "def", NULL
};

int ch = 32, tok, int_val, tok_len, hHere = 0, numSymbols = 0;
char id_name[256], cur_line[256] = {0}, heap[HEAP_SZ];
int cur_off = 0, cur_lnum = 0, is_eof = 0;
int code[CODE_SZ], arg1[CODE_SZ], arg2[CODE_SZ], codeSz = 0;
SYM_T symbols[SYMBOLS_SZ];
FILE *input_fp = NULL;

void statements(int endTok);

//---------------------------------------------------------------------------
// Utilities
void msg(int fatal, char *s) {
    fprintf(stderr, "\n%s at(%d, %d)", s, cur_lnum, cur_off);
    fprintf(stderr, "\n%s", cur_line);
    for (int i = 2; i < cur_off; i++) { fprintf(stderr, " "); } fprintf(stderr, "^\n");
    if (fatal) { exit(1); }
}

void syntax_error() { msg(1, "syntax error"); }
int isAlpha(int ch) { return BTWI(ch, 'A', 'Z') || BTWI(ch, 'a', 'z') || (ch == '_'); }
int isNum(int ch) { return BTWI(ch, '0', '9'); }
int isAlphaNum(int ch) { return isAlpha(ch) || isNum(ch); }
char *symName(int sym) { return symbols[sym].name; }
char *asmName(int sym) { return symbols[sym].asm_name; }
char *hAlloc(int sz) { hHere += sz; return &heap[hHere-sz]; }
int g2(int op, int a, int b) { code[++codeSz]=op; arg1[codeSz]=a; arg2[codeSz]=b; return codeSz; }
int g1(int op, int a) { return g2(op, a, 0); }
int g(int op) { return g2(op, 0, 0); }

void next_line() {
    cur_off = 0;
    cur_lnum++;
    if (fgets(cur_line, 256, input_fp) != cur_line) {
        cur_line[0] = 0;
        is_eof = 1;
    }
    // printf("; %s", cur_line);
}

void next_ch() {
    if (is_eof) { ch = EOF; return; }
    if (cur_line[cur_off] == 0) {
        next_line();
        if (is_eof) { ch = EOF; return; }
    }
    ch = cur_line[cur_off++];
    if (ch == 9) { ch = cur_line[cur_off-1] = 32; }
}

/*---------------------------------------------------------------------------*/
/* Lexer */
void next_token() {
    again:
    while (BTWI(ch,1,32)) { next_ch(); }
    switch (ch) {
    case EOF: tok = EOI; break;
    case '{': next_ch(); tok = TOK_LBRA;  break;
    case '}': next_ch(); tok = TOK_RBRA;  break;
    case '(': next_ch(); tok = TOK_LPAR;  break;
    case ')': next_ch(); tok = TOK_RPAR;  break;
    case '[': next_ch(); tok = TOK_LARR;  break;
    case ']': next_ch(); tok = TOK_RARR;  break;
    case '+': next_ch(); tok = TOK_PLUS;
        if (ch == '+') { next_ch(); tok = TOK_INC; }
        if (ch == '=') { next_ch(); tok = TOK_PLEQ; }
        break;
    case '-': next_ch(); tok = TOK_MINUS;
        if (ch == '-') { next_ch(); tok = TOK_DEC; }
        break;
    case '*': next_ch(); tok = TOK_STAR;  break;
    case '/': next_ch(); tok = TOK_SLASH;
        if (ch == '/') { // Line comment?
            while ((ch) && (ch != 10) && (ch != EOF)) { next_ch(); }
            goto again;
        }
        break;
    case ';': next_ch(); tok = TOK_SEMI;  break;
    case ',': next_ch(); tok = TOK_COMMA; break;
    case '<': next_ch(); tok = TOK_LT;    break;
    case '>': next_ch(); tok = TOK_GT;    break;
    case '^': next_ch(); tok = TOK_XOR;   break;
    case '=': next_ch(); tok = TOK_SET;
        if (ch == '=') { tok = TOK_EQ; next_ch(); }
        break;
    case '|': next_ch(); tok = TOK_OR; break;
    case '&': next_ch(); tok = TOK_AND; break;
    case '"': tok = TOK_STR;
        tok_len = 0;
        next_ch();
        while (ch != '"') {
            if (ch == EOF) { syntax_error(); }
            id_name[tok_len++] = ch;
            next_ch();
        }
        id_name[tok_len] = 0;
        next_ch();
        break;
    case '\'': next_ch(); int_val = ch; next_ch();
        if (ch == '\'') { next_ch(); tok = TOK_NUM; } else { syntax_error(); }
        break;
    default:
        if (isNum(ch)) {
            int_val = 0; /* missing overflow check */
            while (isNum(ch)) { int_val = int_val  *10 + (ch - '0'); next_ch(); }
            tok = TOK_NUM;
        }
        else if (isAlpha(ch)) {
            tok_len = 0; /* missing overflow check */
            while (isAlphaNum(ch)) { id_name[tok_len++] = ch; next_ch(); }
            id_name[tok_len] = '\0';
            tok = 0;
            while ((words[tok] != NULL) && (strcmp(words[tok], id_name) != 0)) { tok++; }
            if (words[tok] == NULL) {
                tok = TOK_ID;
                if ((id_name[1] == 0) && (BTWI(id_name[0], 'A', 'Z'))) {
                    tok = TOK_REG;
                    int_val = id_name[0] - 'A';
                }
            }
        }
        else { syntax_error(); }
        break;
    }
}

void tokenShouldBe(int exp) {
    if (tok != exp) {
        fprintf(stderr, "\n-expected token [%d], not[%d]-", exp, tok);
        syntax_error();
    }
}

void expectToken(int exp) { tokenShouldBe(exp); next_token(); }
void expectNext(int exp) { next_token(); expectToken(exp); }
void nextShouldBe(int exp) { next_token(); tokenShouldBe(exp); }
void tokenShouldNotBe(int x) { if (tok == x) { syntax_error(); } }

/*---------------------------------------------------------------------------*/
/* Symbols - 'C' = Char, 'I' = INT,  'F' = Function, 'S' = String, 'T' = Target */

int findSymbol(char *name, char type) {
    for (int i = 0; i < numSymbols; i++) {
        SYM_T *x = &symbols[i];
        if (strcmp(x->name, name) == 0) {
            if (x->type == type) { return i; }
            else { return -1; }
        }
    }
    return -1;
}

int genSymbol(char *name, char type) {
    int i = findSymbol(name, type);
    if (0 <= i) { return i; }
    i = numSymbols++;
    SYM_T *x = &symbols[i];
    x->strVal = NULL;
    x->type = type;
    x->sz = 1;
    strcpy(x->name, name);
    sprintf(x->asm_name, "%c%d", type, i);
    return i;
}

int genTarget() {
    static int seq = 0;
    char buf[8];
    sprintf(buf, "T%d", ++seq);
    return genSymbol(buf, 'T');
}


// ---------------------------------------------------------------------------
// Code generation
enum {
    NOP, GETIMM, GETREG, GETVAR, SETREG, SETVAR
    , REGA, REGB, REGC, REGD, SYS
    , ADD, SUB, MUL, DIV
    , INCVAR, DECVAR, INCREG, DECREG
    , LT, GT, EQ, NEQ
    , AND, OR, XOR, NOT
    , DEFUN, TARGET, TEST, JMP, JZ, JNZ, CALL, RET
};

void optimizeCode() {
    for (int i = 1; i <= codeSz; i++) {
        int op = code[i];
        int a1 = arg1[i];
        int a2 = arg2[i];
        if (op == ADD) { 
            int nextOp = code[i+1];
            int nextA1 = arg1[i+1];
            // if ((nextOp == IRL_LIT) && (nextA1 == 0)) {
            //     irl[i] = IRL_NOP; // no-op
            //     i++;
            // }
        }
    }
}

char *regName(int r) {
    static char buf[4];
    sprintf(buf, "E%CX", r+'A');
    return buf;
}

int useNext(int i) {
    if (codeSz < i++) { return i; }
    int op = code[i], a1 = arg1[i], a2 = arg2[i];
    if (op == GETVAR) { printf("[%s] ; %s", asmName(a1), symName(a1)); }
    if (op == GETREG) { printf("[reg_%c]", a1+'A'); }
    if (op == GETIMM) { printf("%d", a1); }
    return i;
}

void outputCode() {
    printf("format ELF executable");
    printf("\n;================== code =====================");
    printf("\nsegment readable executable");
    printf("\nstart:\n\tCALL %s", asmName(findSymbol("main", 'F')));
    printf("\n;================== library ==================");
    printf("\nexit:\n\tMOV EAX, 1\n\tXOR EBX, EBX\n\tINT 0x80\n");
    printf("\n;=============================================");

    for (int i = 1; i <= codeSz; i++) {
        int op = code[i], a1 = arg1[i], a2 = arg2[i];
        char *r1 = regName(a1), *r2 = regName(a2);
        char *n1 = symName(a1), *n2 = symName(a2);
        char *s1 = asmName(a1), *s2 = asmName(a2);
        switch (op) {
            case  GETIMM:  printf("\n\tMOV  EAX, %d", a1);
            BCASE GETVAR:  printf("\n\tMOV  EAX, [%s] ; %s", s1, n1);
            BCASE GETREG:  printf("\n\tMOV  EAX, [reg_%c]", a1+'A');
            BCASE SETVAR:  printf("\n\tMOV  [%s], EAX ; %s", s1, n1);
            BCASE SETREG:  printf("\n\tMOV  [reg_%c], EAX", a1+'A');
            BCASE REGA:    printf("\n\tMOV  EAX, [A]");
            BCASE REGB:    printf("\n\tMOV  EBX, [B]");
            BCASE REGC:    printf("\n\tMOV  ECX, [C]");
            BCASE REGD:    printf("\n\tMOV  EDX, [D]");
            BCASE SYS:     printf("\n\tINT  0x80");
            BCASE ADD:     printf("\n\tADD  EAX, "); i = useNext(i);
            BCASE SUB:     printf("\n\tSUB  EAX, "); i = useNext(i);
            BCASE MUL:     printf("\n\tIMUL EAX, "); i = useNext(i);
            BCASE DIV:     printf("\n\tCDQ\n\tIDIV "); i = useNext(i);
            BCASE INCVAR:  printf("\n\tINC  [%s]", s1);
            BCASE DECVAR:  printf("\n\tDEC  [%s]", s1);
            BCASE INCREG:  printf("\n\tINC  [reg_%c]", a1+'A');
            BCASE DECREG:  printf("\n\tDEC  [reg_%c]", a1+'A');
            BCASE DEFUN:   printf("\n\n%s: ; %s", s1, n1);
            BCASE RET:     printf("\n\tRET");
        }
    }
    printf("\n;================== data =====================");
    printf("\nsegment readable writeable");
    printf("\n;=============================================");
    printf("\n; symbols: %d entries, %d used", SYMBOLS_SZ, numSymbols);
    printf("\n; ------------------------------------");

    for (int i = 0; i < numSymbols; i++) {
        SYM_T *x = &symbols[i];
        if (x->type == 'S') { printf("\n%s\t\tdb \"%s\",0 ; %s", x->asm_name, x->strVal, x->name); }
    }
    for (int i = 0; i < numSymbols; i++) {
        SYM_T *x = &symbols[i];
        if (x->type == 'I') { printf("\n%s\t\t\trd %-10d ; %s", x->asm_name, x->sz, x->name); }
        else if (x->type == 'C') { printf("\n%s\t\t\trb %-10d ; %s", x->asm_name, x->sz, x->name); }
    }
    printf("\n_sps\t\trd 26");
    for (int i = 0; i < 26; i++) {
        printf("\nreg_%c\t\trd 32", 'A' + i);
    }
}

/*---------------------------------------------------------------------------*/
/* Parser. */  

int lastTerm; // 1=last was reg, 2=last was var
int term() {
    lastTerm = 0;
    if (tok == TOK_REG) { lastTerm=1; g1(GETREG, int_val); return 1; }
    if (tok == TOK_ID)  { lastTerm=2; g1(GETVAR, genSymbol(id_name, 'I')); return 1; }
    if (tok == TOK_NUM) { g1(GETIMM, int_val); return 1; }
    // if (tok == TOK_STR)  { g2(MOVREG, 0, genSymbol(id_name, 'S')); return 1; }
    return 0;
}

void next_term() {
    next_token();
    if (term()) { return; }
    syntax_error();
}

int evalOp(int id) {
    again:
    if (id == TOK_PLUS) { return id; }
    else if (id == TOK_MINUS) { return id; }
    else if (id == TOK_STAR)  { return id; }
    else if (id == TOK_SLASH) { return id; }
    else if (id == TOK_LT)    { return id; }
    else if (id == TOK_GT)    { return id; }
    else if (id == TOK_EQ)    { return id; }
    else if (id == TOK_NEQ)   { return id; }
    else if (id == TOK_AND)   { return id; }
    else if (id == TOK_OR)    { return id; }
    else if (id == TOK_XOR)   { return id; }
    else if (0 < lastTerm) {
        if (lastTerm == 1) {
            if (tok == TOK_INC) { g1(INCREG, int_val); }
            else if (tok == TOK_DEC) { g1(DECREG, int_val); }
            else { return 0; }
            next_token(); lastTerm=0;
            goto again;
        }
        else if (lastTerm == 2) {
            int s = arg1[codeSz];
            if (tok == TOK_INC) { g1(INCVAR, s); }
            else if (tok == TOK_DEC) { g1(DECVAR, s); }
            else { return 0; }
            next_token(); lastTerm=0;
            goto again;
        }
    }
    return 0;
}

void expr() {
    if (term() == 0) { return; }
    next_token();
    int op = evalOp(tok);
    while (op != 0) {
        if (op == TOK_PLUS)       { g(ADD);  next_term(); }
        else if (op == TOK_MINUS) { g(SUB);  next_term(); }
        else if (op == TOK_STAR)  { g(MUL);  next_term(); }
        else if (op == TOK_SLASH) { g(DIV);  next_term(); }
        else if (op == TOK_LT)    { g(LT);   next_term(); }
        else if (op == TOK_GT)    { g(GT);   next_term(); }
        else if (op == TOK_EQ)    { g(EQ);   next_term(); }
        else if (op == TOK_NEQ)   { g(NEQ);  next_term(); }
        else if (op == TOK_AND)   { g(AND);  next_term(); }
        else if (op == TOK_OR)    { g(OR);   next_term(); }
        else if (op == TOK_XOR)   { g(XOR);  next_term(); }
        else { syntax_error(); }
        next_token();
        op = evalOp(tok);
    }
}

void ifStmt() {
    int t1 = genTarget();
    expectNext(TOK_LPAR);
    expr();
    expectToken(TOK_RPAR);
    g(TEST);
    g1(JZ, t1);
    expectToken(TOK_THEN);
    statements(TOK_END);
    expectToken(TOK_END);
    g1(TARGET, t1);
}

void whileStmt() {
    int t1 = genTarget();
    int t2 = genTarget();
    g1(TARGET, t1);
    expectNext(TOK_LPAR);
    expr();
    expectToken(TOK_RPAR);
    g2(TEST, 0, 0);
    g1(JZ, t2);
    statements(TOK_END);
    g1(JMP, t1);
    g1(TARGET, t2);
}

void idStmt() {
    int si = findSymbol(id_name, 'F');
    if (0 <= si) { g1(CALL, si); expectNext(TOK_SEMI); return; }
    si = findSymbol(id_name, 'I');
    if (si < 0) { si = findSymbol(id_name, 'C'); }
    if (si < 0) { msg(1, "variable not defined!"); }
    next_token();
    SYM_T *s = &symbols[si];
    if (tok == TOK_SET) { next_token(); expr(); g2(SETVAR, si, 0); }
    else if (tok == TOK_INC) { next_token(); g1(INCVAR, si); }
    else if (tok == TOK_DEC) { next_token(); g1(DECVAR, si); }
    else { syntax_error(); }
    expectToken(TOK_SEMI);
}

void regStmt() {
    int regNum = int_val;
    next_token();
    if (tok == TOK_SET) { next_token(); expr(); g2(SETREG, regNum, 0); }
    else if (tok == TOK_INC) { next_token(); g1(INCREG, regNum); }
    else if (tok == TOK_DEC) { next_token(); g1(DECREG, regNum); }
    else { syntax_error(); }
    expectToken(TOK_SEMI);
}

void statements(int endTok) {
    while (tok != endTok) {
        if (tok == IF_TOK)         { ifStmt(); }
        else if (tok == WHILE_TOK) { whileStmt(); }
        else if (tok == RET_TOK)   { expectNext(TOK_SEMI); g(RET); }
        else if (tok == TOK_ID)    { idStmt(); }
        else if (tok == TOK_REG)   { regStmt(); }
    }
}

void statement() {
}

/*---------------------------------------------------------------------------*/
/* Top level definitions. */

void varDef(int type) {
    nextShouldBe(TOK_ID);
    int s = genSymbol(id_name, type);
    next_token();
    if (tok == TOK_SEMI) { return; }
    expectToken(TOK_LARR);
    expectToken(TOK_NUM);
    symbols[s].sz = int_val;
    expectToken(TOK_RARR);
}

void funcDef() {
    next_token();
    int s = genSymbol(id_name, 'F');
    g1(DEFUN, s);
    next_token();
    statements(TOK_END);
    expectToken(TOK_END);
    if (code[codeSz] != RET) { g(RET); }
}

/*---------------------------------------------------------------------------*/
/* Main program. */
int main(int argc, char *argv[]) {
    char *fn = (argc > 1) ? argv[1] : "jn.jn";
    input_fp = stdin;
    if (fn) {
        input_fp = fopen(fn, "rt");
        if (!input_fp) { msg(1, "cannot open source file!"); }
    }
    next_token();
    while (tok != EOI) {
        if (tok == TOK_DEF) { funcDef(); }
        else if (tok == INT_TOK) { varDef('I'); expectToken(TOK_SEMI); }
        else if (tok == CHAR_TOK) { varDef('C'); expectToken(TOK_SEMI); }
    }
    fclose(input_fp);
    optimizeCode();
    outputCode();
    return 0;
}
