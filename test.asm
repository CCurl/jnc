
; 24 instructions removed
format ELF executable
;================== code =====================
segment readable executable
start:
	LEA  EBP, [locals]
	CALL F41
;================== library ==================
exit:
	MOV EAX, 1
	XOR EBX, EBX
	INT 0x80

;=============================================

F30: ; strLen
	MOV  EAX, ECX ; C
	MOV  EDX, EAX ; D
T1:
	MOVZX  EAX, BYTE [EDX]
	CMP  EAX, 0
	JZ   T2
	INC  EDX ; D
	JMP  T1
T2:
	MOV  EAX, EDX ; D
	SUB  EAX, ECX ; C
	MOV  EDX, EAX ; D
	RET

F33: ; print
	CALL F30 ; strLen
	MOV  EBX, 0 ; B
	MOV  EAX, 4 ; A
	MOV  EAX, EAX
	MOV  EBX, EBX
	MOV  ECX, ECX
	MOV  EDX, EDX
	INT  0x80
	RET

F34: ; Bye
	MOV  EAX, 1 ; A
	MOV  EBX, 0 ; B
	MOV  EAX, EAX
	MOV  EBX, EBX
	MOV  ECX, ECX
	MOV  EDX, EDX
	INT  0x80
	RET

F35: ; MXB
	MOV  EAX, [I12] ; M
	IMUL EAX, [I23] ; X
	ADD  EAX, EBX ; B
	MOV  [I24], EAX ; Y
	RET

F36: ; BM
	ADD  EBP, 40;
	LEA  EAX, [S37]; 37
	MOV  ECX, EAX ; C
	CALL F33 ; print
	MOV  EAX, 1000
	IMUL EAX, 1000
	IMUL EAX, 1000
	MOV  EDX, EAX ; D
T3:
	MOV  EAX, EDX ; D
	CMP  EAX, 0
	JZ   T4
	DEC  EDX ; D
	JMP  T3
T4:
	LEA  EAX, [S40]; 40
	MOV  ECX, EAX ; C
	CALL F33 ; print
	SUB  EBP, 40;
	RET

F41: ; main
	LEA  EAX, [S42]; 42
	MOV  ECX, EAX ; C
	CALL F33 ; print
	CALL F36 ; BM
	MOV  ECX, 1 ; C
	MOV  EAX, 1
	ADD  EAX, [I27] ; Abc
	SUB  EAX, 3
	MOV  EAX, ECX ; C
	XOR  EDI, EDI
	CMP  EAX, 0
	JE   @F
	DEC  EDI
@@:	MOV  EAX, EDI
	CMP  EAX, 0
	JNZ  T5
	LEA  EAX, [S44]; 44
	MOV  ECX, EAX ; C
	CALL F33 ; print
	RET
T5:
	IMUL EAX, EBX ; B
	CDQ
	IDIV ECX ; C
	MOV  EBX, EAX ; B
	MOV  EAX, [I8] ; I
	ADD  EAX, 1
	MOV  [I8], EAX ; I
	MOV  [I12], 13 ; M
	MOV  [I23], 2 ; X
	MOV  EBX, 100 ; B
	CALL F35 ; MXB
	ADD  EAX, 3
	ADD  EAX, [I45] ; yyy
	MOV  [I26], EAX ; xxx
	INC  EDX ; D
	DEC  [I26] ; xxx
	MOV  EAX, [I24] ; Y
	INC  [I24] ; Y
	MOV  [I23], EAX ; X
	MOV  EAX, [I24] ; Y
	DEC  [I24] ; Y
	MOV  [I25], EAX ; Z
	MOV  EAX, [I26] ; xxx
	INC  [I26] ; xxx
	MOV  [I24], EAX ; Y
	MOV  EAX, [I26] ; xxx
	DEC  [I26] ; xxx
	MOV  [I25], EAX ; Z
	LEA  EAX, [C29]; 29
	MOV  ECX, EAX ; C
	RET
;================== data =====================
segment readable writeable
;=============================================
; symbols: 1000 entries, 46 used
; ------------------------------------
S37			db 83,116,97,114,116,32,46,46,46,32,0
S40			db 101,110,100,10,0
S42			db 104,101,108,108,111,33,32,0
S44			db 32,67,61,61,48,33,10,0
; EAX			rd 1          ; A
; EBX			rd 1          ; B
; ECX			rd 1          ; C
; EDX			rd 1          ; D
I4			rd 1          ; E (4)
I5			rd 1          ; F (5)
I6			rd 1          ; G (6)
I7			rd 1          ; H (7)
I8			rd 1          ; I (8)
I9			rd 1          ; J (9)
I10			rd 1          ; K (10)
I11			rd 1          ; L (11)
I12			rd 1          ; M (12)
I13			rd 1          ; N (13)
I14			rd 1          ; O (14)
I15			rd 1          ; P (15)
I16			rd 1          ; Q (16)
I17			rd 1          ; R (17)
I18			rd 1          ; S (18)
I19			rd 1          ; T (19)
I20			rd 1          ; U (20)
I21			rd 1          ; V (21)
I22			rd 1          ; W (22)
I23			rd 1          ; X (23)
I24			rd 1          ; Y (24)
I25			rd 1          ; Z (25)
I26			rd 1          ; xxx (26)
I27			rd 1000000    ; Abc (27)
C28			rb 1          ; yyy
C29			rb 256        ; Def
I45			rd 1          ; yyy (45)
locals		rd 400
_sps		rd 26
reg_A		rd 32
reg_B		rd 32
reg_C		rd 32
reg_D		rd 32
reg_E		rd 32
reg_F		rd 32
reg_G		rd 32
reg_H		rd 32
reg_I		rd 32
reg_J		rd 32
reg_K		rd 32
reg_L		rd 32
reg_M		rd 32
reg_N		rd 32
reg_O		rd 32
reg_P		rd 32
reg_Q		rd 32
reg_R		rd 32
reg_S		rd 32
reg_T		rd 32
reg_U		rd 32
reg_V		rd 32
reg_W		rd 32
reg_X		rd 32
reg_Y		rd 32
reg_Z		rd 32