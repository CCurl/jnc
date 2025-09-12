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
	MOV  EAX, 1
	MOV  [I4], EAX ; A
	MOV  EAX, 0
	MOV  [I5], EAX ; B
	MOV  EAX, [I4]
	MOV  EBX, [I5]
	MOV  ECX, [I6]
	MOV  EDX, [I7]
	INT  0x80
	MOV  EAX, 111
	MOV  EAX, EAX ; EAX
	MOV  EAX, 222
	MOV  EBX, EAX ; EBX
	MOV  EAX, 333
	MOV  ECX, EAX ; ECX
	MOV  EAX, 444
	MOV  EDX, EAX ; EDX
	RET

F36: ; main
	LEA  EAX, [S37]; 37
	MOV  [I6], EAX ; C
	MOV  EAX, 6
	MOV  [I7], EAX ; D
	MOV  EAX, 4
	MOV  [I4], EAX ; A
	MOV  EAX, 0
	MOV  [I5], EAX ; B
	MOV  EAX, [I4]
	MOV  EBX, [I5]
	MOV  ECX, [I6]
	MOV  EDX, [I7]
	INT  0x80
	MOV  EAX, 12
	MOV  [I6], EAX ; C
	MOV  EAX, 1
	ADD  EAX, [I31] ; Abc
	SUB  EAX, 3
	MOV  [I4], EAX ; A
	MOV  EAX, [I6] ; C
	CMP  EAX, 0
	CMP  EAX, 0
	JNZ  T1
	MOV  EAX, 4
	MOV  [I4], EAX ; A
	MOV  EAX, 0
	MOV  [I5], EAX ; B
	LEA  EAX, [S39]; 39
	MOV  [I6], EAX ; C
	MOV  EAX, 6
	MOV  [I7], EAX ; D
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
	MOV  EAX, 13
	MOV  [I16], EAX ; M
	MOV  EAX, 2
	MOV  [I27], EAX ; X
	MOV  EAX, 100
	MOV  [I5], EAX ; B
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
	MOV  EAX, 5
	MOV  [I7], EAX ; D
	MOV  EAX, 4
	MOV  [I4], EAX ; A
	MOV  EAX, 0
	MOV  [I5], EAX ; B
	MOV  EAX, [I4]
	MOV  EBX, [I5]
	MOV  ECX, [I6]
	MOV  EDX, [I7]
	INT  0x80
	MOV  EAX, 500
	IMUL EAX, 1000
	IMUL EAX, 1000
	MOV  [I7], EAX ; D
T2:
	MOV  EAX, [I7] ; D
	CMP  EAX, 0
	JZ   T3
	DEC  [I7] ; D
	JMP  T2
T3:
	LEA  EAX, [S44]; 44
	MOV  [I6], EAX ; C
	MOV  EAX, 4
	MOV  [I7], EAX ; D
	MOV  EAX, 4
	MOV  [I4], EAX ; A
	MOV  EAX, 0
	MOV  [I5], EAX ; B
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
S39			db 67,61,61,48,33,10,0
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