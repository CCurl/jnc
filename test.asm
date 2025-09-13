
; optimize:   1: op=25, a1=30
; optimize:   2: op=3, a1=12
; optimize:   3: op=10, a1=0
; optimize:   4: op=999, a1=23
; optimize:   5: op=8, a1=0
; optimize:   6: op=999, a1=1
; optimize:   7: op=5, a1=24
; optimize:   8: op=32, a1=0
; optimize:   9: op=25, a1=31
; optimize:  10: op=1, a1=1
; optimize:  11: op=999, a1=0
; optimize:  12: op=1, a1=0
; optimize:  13: op=999, a1=1
; optimize:  14: op=7, a1=0
; optimize:  15: op=1, a1=111
; optimize:  16: op=999, a1=0
; optimize:  17: op=1, a1=222
; optimize:  18: op=999, a1=1
; optimize:  19: op=1, a1=333
; optimize:  20: op=999, a1=2
; optimize:  21: op=1, a1=444
; optimize:  22: op=999, a1=3
; optimize:  23: op=32, a1=0
; optimize:  24: op=25, a1=32
; optimize:  25: op=1, a1=0
; optimize:  26: op=999, a1=1
; optimize:  27: op=4, a1=33
; optimize:  28: op=5, a1=2
; optimize:  29: op=1, a1=6
; optimize:  30: op=999, a1=3
; optimize:  31: op=1, a1=4
; optimize:  32: op=999, a1=0
; optimize:  33: op=7, a1=0
; optimize:  34: op=1, a1=1
; optimize:  35: op=999, a1=2
; optimize:  36: op=1, a1=1
; optimize:  37: op=8, a1=0
; optimize:  38: op=999, a1=27
; optimize:  39: op=9, a1=0
; optimize:  40: op=999, a1=3
; optimize:  41: op=5, a1=0
; optimize:  42: op=3, a1=2
; optimize:  43: op=18, a1=0
; optimize:  44: op=999, a1=0
; optimize:  45: op=20, a1=0
; optimize:  46: op=30, a1=34
; optimize:  47: op=1, a1=0
; optimize:  48: op=999, a1=1
; optimize:  49: op=4, a1=35
; optimize:  50: op=5, a1=2
; optimize:  51: op=1, a1=7
; optimize:  52: op=999, a1=3
; optimize:  53: op=1, a1=4
; optimize:  54: op=999, a1=0
; optimize:  55: op=7, a1=0
; optimize:  56: op=32, a1=0
; optimize:  57: op=26, a1=34
; optimize:  58: op=3, a1=0
; optimize:  59: op=10, a1=0
; optimize:  60: op=999, a1=1
; optimize:  61: op=11, a1=0
; optimize:  62: op=999, a1=2
; optimize:  63: op=5, a1=1
; optimize:  64: op=3, a1=8
; optimize:  65: op=8, a1=0
; optimize:  66: op=999, a1=1
; optimize:  67: op=5, a1=8
; optimize:  68: op=1, a1=13
; optimize:  69: op=999, a1=12
; optimize:  70: op=1, a1=2
; optimize:  71: op=999, a1=23
; optimize:  72: op=1, a1=100
; optimize:  73: op=999, a1=1
; optimize:  74: op=31, a1=30
; optimize:  75: op=3, a1=0
; optimize:  76: op=8, a1=0
; optimize:  77: op=999, a1=3
; optimize:  78: op=8, a1=0
; optimize:  79: op=999, a1=36
; optimize:  80: op=5, a1=26
; optimize:  81: op=12, a1=3
; optimize:  82: op=13, a1=26
; optimize:  83: op=3, a1=24
; optimize:  84: op=12, a1=24
; optimize:  85: op=5, a1=23
; optimize:  86: op=3, a1=24
; optimize:  87: op=13, a1=24
; optimize:  88: op=5, a1=25
; optimize:  89: op=3, a1=26
; optimize:  90: op=12, a1=26
; optimize:  91: op=5, a1=24
; optimize:  92: op=3, a1=26
; optimize:  93: op=13, a1=26
; optimize:  94: op=5, a1=25
; optimize:  95: op=4, a1=29
; optimize:  96: op=5, a1=2
; optimize:  97: op=4, a1=37
; optimize:  98: op=5, a1=2
; optimize:  99: op=1, a1=5
; optimize: 100: op=999, a1=3
; optimize: 101: op=1, a1=0
; optimize: 102: op=999, a1=1
; optimize: 103: op=1, a1=4
; optimize: 104: op=999, a1=0
; optimize: 105: op=7, a1=0
; optimize: 106: op=1, a1=1000
; optimize: 107: op=10, a1=0
; optimize: 108: op=999, a1=1000
; optimize: 109: op=10, a1=0
; optimize: 110: op=999, a1=1000
; optimize: 111: op=5, a1=3
; optimize: 112: op=26, a1=38
; optimize: 113: op=3, a1=3
; optimize: 114: op=20, a1=0
; optimize: 115: op=29, a1=39
; optimize: 116: op=13, a1=3
; optimize: 117: op=28, a1=38
; optimize: 118: op=26, a1=39
; optimize: 119: op=4, a1=40
; optimize: 120: op=5, a1=2
; optimize: 121: op=1, a1=4
; optimize: 122: op=999, a1=3
; optimize: 123: op=1, a1=0
; optimize: 124: op=999, a1=1
; optimize: 125: op=1, a1=4
; optimize: 126: op=999, a1=0
; optimize: 127: op=7, a1=0
; optimize: 128: op=32, a1=0
; 37 instructions removed
format ELF executable
;================== code =====================
segment readable executable
start:
	CALL F32
;================== library ==================
exit:
	MOV EAX, 1
	XOR EBX, EBX
	INT 0x80

;=============================================

F30: ; MXB
	MOV  EAX, [I12] ; M
	IMUL EAX, [I23] ; X
	ADD  EAX, EBX ; B
	MOV  [I24], EAX ; Y
	RET

F31: ; Bye
	MOV  EAX, 1 ; A
	MOV  EBX, 0 ; B
	MOV  EAX, EAX
	MOV  EBX, EBX
	MOV  ECX, ECX
	MOV  EDX, EDX
	INT  0x80
	MOV  EAX, 111 ; A
	MOV  EBX, 222 ; B
	MOV  ECX, 333 ; C
	MOV  EDX, 444 ; D
	RET

F32: ; main
	MOV  EBX, 0 ; B
	LEA  EAX, [S33]; 33
	MOV  ECX, EAX ; C
	MOV  EDX, 6 ; D
	MOV  EAX, 4 ; A
	MOV  EAX, EAX
	MOV  EBX, EBX
	MOV  ECX, ECX
	MOV  EDX, EDX
	INT  0x80
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
	JNZ  T1
	MOV  EBX, 0 ; B
	LEA  EAX, [S35]; 35
	MOV  ECX, EAX ; C
	MOV  EDX, 7 ; D
	MOV  EAX, 4 ; A
	MOV  EAX, EAX
	MOV  EBX, EBX
	MOV  ECX, ECX
	MOV  EDX, EDX
	INT  0x80
	RET
T1:
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
	CALL F30 ; MXB
	ADD  EAX, 3
	ADD  EAX, [I36] ; yyy
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
	LEA  EAX, [S37]; 37
	MOV  ECX, EAX ; C
	MOV  EDX, 5 ; D
	MOV  EBX, 0 ; B
	MOV  EAX, 4 ; A
	MOV  EAX, EAX
	MOV  EBX, EBX
	MOV  ECX, ECX
	MOV  EDX, EDX
	INT  0x80
	MOV  EAX, 1000
	IMUL EAX, 1000
	IMUL EAX, 1000
	MOV  EDX, EAX ; D
T2:
	MOV  EAX, EDX ; D
	CMP  EAX, 0
	JZ   T3
	DEC  EDX ; D
	JMP  T2
T3:
	LEA  EAX, [S40]; 40
	MOV  ECX, EAX ; C
	MOV  EDX, 4 ; D
	MOV  EBX, 0 ; B
	MOV  EAX, 4 ; A
	MOV  EAX, EAX
	MOV  EBX, EBX
	MOV  ECX, ECX
	MOV  EDX, EDX
	INT  0x80
	RET
;================== data =====================
segment readable writeable
;=============================================
; symbols: 1000 entries, 41 used
; ------------------------------------
S33			db 104,101,108,108,111,33,0
S35			db 32,67,61,61,49,33,10,0
S37			db 32,46,46,46,32,0
S40			db 98,121,101,10,0
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
I36			rd 1          ; yyy (36)
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