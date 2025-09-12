
; optimize:   1: op=25, a1=34
; optimize:   2: op=3, a1=16
; optimize:   3: op=10, a1=0
; optimize:   4: op=999, a1=27
; optimize:   5: op=8, a1=0
; optimize:   6: op=999, a1=5
; optimize:   7: op=5, a1=28
; optimize:   8: op=32, a1=0
; optimize:   9: op=25, a1=35
; optimize:  10: op=1, a1=1
; optimize:  11: op=999, a1=4
; optimize:  12: op=1, a1=0
; optimize:  13: op=999, a1=5
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
; optimize:  24: op=25, a1=36
; optimize:  25: op=1, a1=4
; optimize:  26: op=999, a1=4
; optimize:  27: op=1, a1=0
; optimize:  28: op=999, a1=5
; optimize:  29: op=4, a1=37
; optimize:  30: op=5, a1=6
; optimize:  31: op=1, a1=6
; optimize:  32: op=999, a1=7
; optimize:  33: op=7, a1=0
; optimize:  34: op=1, a1=1
; optimize:  35: op=999, a1=6
; optimize:  36: op=1, a1=1
; optimize:  37: op=8, a1=0
; optimize:  38: op=999, a1=31
; optimize:  39: op=9, a1=0
; optimize:  40: op=999, a1=3
; optimize:  41: op=5, a1=4
; optimize:  42: op=3, a1=6
; optimize:  43: op=18, a1=0
; optimize:  44: op=999, a1=0
; optimize:  45: op=20, a1=0
; optimize:  46: op=30, a1=38
; optimize:  47: op=1, a1=4
; optimize:  48: op=999, a1=4
; optimize:  49: op=1, a1=0
; optimize:  50: op=999, a1=5
; optimize:  51: op=4, a1=39
; optimize:  52: op=5, a1=6
; optimize:  53: op=1, a1=7
; optimize:  54: op=999, a1=7
; optimize:  55: op=7, a1=0
; optimize:  56: op=32, a1=0
; optimize:  57: op=26, a1=38
; optimize:  58: op=3, a1=4
; optimize:  59: op=10, a1=0
; optimize:  60: op=999, a1=5
; optimize:  61: op=11, a1=0
; optimize:  62: op=999, a1=6
; optimize:  63: op=5, a1=5
; optimize:  64: op=3, a1=12
; optimize:  65: op=8, a1=0
; optimize:  66: op=999, a1=1
; optimize:  67: op=5, a1=12
; optimize:  68: op=1, a1=13
; optimize:  69: op=999, a1=16
; optimize:  70: op=1, a1=2
; optimize:  71: op=999, a1=27
; optimize:  72: op=1, a1=100
; optimize:  73: op=999, a1=5
; optimize:  74: op=31, a1=34
; optimize:  75: op=3, a1=4
; optimize:  76: op=8, a1=0
; optimize:  77: op=999, a1=3
; optimize:  78: op=8, a1=0
; optimize:  79: op=999, a1=40
; optimize:  80: op=5, a1=30
; optimize:  81: op=12, a1=7
; optimize:  82: op=13, a1=30
; optimize:  83: op=3, a1=28
; optimize:  84: op=12, a1=28
; optimize:  85: op=5, a1=27
; optimize:  86: op=3, a1=28
; optimize:  87: op=13, a1=28
; optimize:  88: op=5, a1=29
; optimize:  89: op=3, a1=30
; optimize:  90: op=12, a1=30
; optimize:  91: op=5, a1=28
; optimize:  92: op=3, a1=30
; optimize:  93: op=13, a1=30
; optimize:  94: op=5, a1=29
; optimize:  95: op=4, a1=33
; optimize:  96: op=5, a1=6
; optimize:  97: op=4, a1=41
; optimize:  98: op=5, a1=6
; optimize:  99: op=1, a1=5
; optimize: 100: op=999, a1=7
; optimize: 101: op=1, a1=4
; optimize: 102: op=999, a1=4
; optimize: 103: op=1, a1=0
; optimize: 104: op=999, a1=5
; optimize: 105: op=7, a1=0
; optimize: 106: op=1, a1=1000
; optimize: 107: op=10, a1=0
; optimize: 108: op=999, a1=1000
; optimize: 109: op=10, a1=0
; optimize: 110: op=999, a1=1000
; optimize: 111: op=5, a1=0
; optimize: 112: op=26, a1=42
; optimize: 113: op=3, a1=0
; optimize: 114: op=20, a1=0
; optimize: 115: op=29, a1=43
; optimize: 116: op=13, a1=0
; optimize: 117: op=28, a1=42
; optimize: 118: op=26, a1=43
; optimize: 119: op=4, a1=44
; optimize: 120: op=5, a1=6
; optimize: 121: op=1, a1=4
; optimize: 122: op=999, a1=7
; optimize: 123: op=1, a1=4
; optimize: 124: op=999, a1=4
; optimize: 125: op=1, a1=0
; optimize: 126: op=999, a1=5
; optimize: 127: op=7, a1=0
; optimize: 128: op=32, a1=0
; 36 instructions removed
format ELF executable
;================== code =====================
segment readable executable
start:
	CALL F36
;================== library ==================
exit:
	MOV EAX, 1
	XOR EBX, EBX
	INT 0x80

;=============================================

F34: ; MXB
	MOV  EAX, [I16] ; M
	IMUL EAX, [I27] ; X
	ADD  EAX, [I5] ; B
	MOV  [I28], EAX ; Y
	RET

F35: ; Bye
	MOV  [I4], 1 ; A
	MOV  [I5], 0 ; B
	MOV  EAX, [I4]
	MOV  EBX, [I5]
	MOV  ECX, [I6]
	MOV  EDX, [I7]
	INT  0x80
	MOV  EAX, 111 ; EAX
	MOV  EBX, 222 ; EBX
	MOV  ECX, 333 ; ECX
	MOV  EDX, 444 ; EDX
	RET

F36: ; main
	MOV  [I4], 4 ; A
	MOV  [I5], 0 ; B
	LEA  EAX, [S37]; 37
	MOV  [I6], EAX ; C
	MOV  [I7], 6 ; D
	MOV  EAX, [I4]
	MOV  EBX, [I5]
	MOV  ECX, [I6]
	MOV  EDX, [I7]
	INT  0x80
	MOV  [I6], 1 ; C
	MOV  EAX, 1
	ADD  EAX, [I31] ; Abc
	SUB  EAX, 3
	MOV  [I4], EAX ; A
	MOV  EAX, [I6] ; C
	XOR  EDI, EDI
	CMP  EAX, 0
	JE   @F
	DEC  EDI
@@:	MOV  EAX, EDI
	CMP  EAX, 0
	JNZ  T1
	MOV  [I4], 4 ; A
	MOV  [I5], 0 ; B
	LEA  EAX, [S39]; 39
	MOV  [I6], EAX ; C
	MOV  [I7], 7 ; D
	MOV  EAX, [I4]
	MOV  EBX, [I5]
	MOV  ECX, [I6]
	MOV  EDX, [I7]
	INT  0x80
	RET
T1:
	MOV  EAX, [I4] ; A
	IMUL EAX, [I5] ; B
	CDQ
	IDIV [I6] ; C
	MOV  [I5], EAX ; B
	MOV  EAX, [I12] ; I
	ADD  EAX, 1
	MOV  [I12], EAX ; I
	MOV  [I16], 13 ; M
	MOV  [I27], 2 ; X
	MOV  [I5], 100 ; B
	CALL F34 ; MXB
	MOV  EAX, [I4] ; A
	ADD  EAX, 3
	ADD  EAX, [I40] ; yyy
	MOV  [I30], EAX ; xxx
	INC  [I7] ; D
	DEC  [I30] ; xxx
	MOV  EAX, [I28] ; Y
	INC  [I28] ; Y
	MOV  [I27], EAX ; X
	MOV  EAX, [I28] ; Y
	DEC  [I28] ; Y
	MOV  [I29], EAX ; Z
	MOV  EAX, [I30] ; xxx
	INC  [I30] ; xxx
	MOV  [I28], EAX ; Y
	MOV  EAX, [I30] ; xxx
	DEC  [I30] ; xxx
	MOV  [I29], EAX ; Z
	LEA  EAX, [C33]; 33
	MOV  [I6], EAX ; C
	LEA  EAX, [S41]; 41
	MOV  [I6], EAX ; C
	MOV  [I7], 5 ; D
	MOV  [I4], 4 ; A
	MOV  [I5], 0 ; B
	MOV  EAX, [I4]
	MOV  EBX, [I5]
	MOV  ECX, [I6]
	MOV  EDX, [I7]
	INT  0x80
	MOV  EAX, 1000
	IMUL EAX, 1000
	IMUL EAX, 1000
T2:
	CMP  EAX, 0
	JZ   T3
	DEC  EAX ; EAX
	JMP  T2
T3:
	LEA  EAX, [S44]; 44
	MOV  [I6], EAX ; C
	MOV  [I7], 4 ; D
	MOV  [I4], 4 ; A
	MOV  [I5], 0 ; B
	MOV  EAX, [I4]
	MOV  EBX, [I5]
	MOV  ECX, [I6]
	MOV  EDX, [I7]
	INT  0x80
	RET
;================== data =====================
segment readable writeable
;=============================================
; symbols: 1000 entries, 45 used
; ------------------------------------
S37			db 104,101,108,108,111,33,0
S39			db 32,67,61,61,49,33,10,0
S41			db 32,46,46,46,32,0
S44			db 98,121,101,10,0
; EAX			rd 1          ; EAX
; EBX			rd 1          ; EBX
; ECX			rd 1          ; ECX
; EDX			rd 1          ; EDX
I4			rd 1          ; A (4)
I5			rd 1          ; B (5)
I6			rd 1          ; C (6)
I7			rd 1          ; D (7)
I8			rd 1          ; E (8)
I9			rd 1          ; F (9)
I10			rd 1          ; G (10)
I11			rd 1          ; H (11)
I12			rd 1          ; I (12)
I13			rd 1          ; J (13)
I14			rd 1          ; K (14)
I15			rd 1          ; L (15)
I16			rd 1          ; M (16)
I17			rd 1          ; N (17)
I18			rd 1          ; O (18)
I19			rd 1          ; P (19)
I20			rd 1          ; Q (20)
I21			rd 1          ; R (21)
I22			rd 1          ; S (22)
I23			rd 1          ; T (23)
I24			rd 1          ; U (24)
I25			rd 1          ; V (25)
I26			rd 1          ; W (26)
I27			rd 1          ; X (27)
I28			rd 1          ; Y (28)
I29			rd 1          ; Z (29)
I30			rd 1          ; xxx (30)
I31			rd 1000000    ; Abc (31)
C32			rb 1          ; yyy
C33			rb 256        ; Def
I40			rd 1          ; yyy (40)
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