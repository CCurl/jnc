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
	MOV  EAX, [I12] ; M
	IMUL EAX, [I23] ; X
	ADD  EAX, [I1] ; B
	MOV  [I24], EAX ; Y
	RET

F35: ; Bye
	MOV  EAX, 1
	MOV  [I0], EAX ; A
	MOV  EAX, 0
	MOV  [I1], EAX ; B
	MOV  EAX, [I0]
	MOV  EBX, [I1]
	MOV  ECX, [I2]
	MOV  EDX, [I3]
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
	MOV  [I2], EAX ; C
	MOV  EAX, 6
	MOV  [I3], EAX ; D
	MOV  EAX, 4
	MOV  [I0], EAX ; A
	MOV  EAX, 0
	MOV  [I1], EAX ; B
	MOV  EAX, [I0]
	MOV  EBX, [I1]
	MOV  ECX, [I2]
	MOV  EDX, [I3]
	INT  0x80
	MOV  EAX, 12
	MOV  [I2], EAX ; C
	MOV  EAX, 1
	ADD  EAX, [I31] ; Abc
	SUB  EAX, 3
	MOV  [I0], EAX ; A
	MOV  EAX, [I2] ; C
	CMP  EAX, 0
	CMP  EAX, 0
	JNZ  T1
	MOV  EAX, 4
	MOV  [I0], EAX ; A
	MOV  EAX, 0
	MOV  [I1], EAX ; B
	LEA  EAX, [S39]; 39
	MOV  [I2], EAX ; C
	MOV  EAX, 6
	MOV  [I3], EAX ; D
	MOV  EAX, [I0]
	MOV  EBX, [I1]
	MOV  ECX, [I2]
	MOV  EDX, [I3]
	INT  0x80
	RET
T1:
	MOV  EAX, [I0] ; A
	IMUL EAX, [I1] ; B
	CDQ
	IDIV [I2] ; C
	MOV  [I1], EAX ; B
	MOV  EAX, [I8] ; I
	ADD  EAX, 1
	MOV  [I8], EAX ; I
	MOV  EAX, 13
	MOV  [I12], EAX ; M
	MOV  EAX, 2
	MOV  [I23], EAX ; X
	MOV  EAX, 100
	MOV  [I1], EAX ; B
	CALL F34 ; MXB
	MOV  EAX, [I0] ; A
	ADD  EAX, 3
	ADD  EAX, [I40] ; yyy
	MOV  [I30], EAX ; xxx
	INC  [I3] ; D
	DEC  [I30] ; xxx
	MOV  EAX, [I24] ; Y
	INC  [I24] ; Y
	MOV  [I23], EAX ; X
	MOV  EAX, [I24] ; Y
	DEC  [I24] ; Y
	MOV  [I25], EAX ; Z
	MOV  EAX, [I30] ; xxx
	INC  [I30] ; xxx
	MOV  [I24], EAX ; Y
	MOV  EAX, [I30] ; xxx
	DEC  [I30] ; xxx
	MOV  [I25], EAX ; Z
	LEA  EAX, [C33]; 33
	MOV  [I2], EAX ; C
	LEA  EAX, [S41]; 41
	MOV  [I2], EAX ; C
	MOV  EAX, 5
	MOV  [I3], EAX ; D
	MOV  EAX, 4
	MOV  [I0], EAX ; A
	MOV  EAX, 0
	MOV  [I1], EAX ; B
	MOV  EAX, [I0]
	MOV  EBX, [I1]
	MOV  ECX, [I2]
	MOV  EDX, [I3]
	INT  0x80
	MOV  EAX, 500
	IMUL EAX, 1000
	IMUL EAX, 1000
	MOV  [I3], EAX ; D
T2:
	MOV  EAX, [I3] ; D
	CMP  EAX, 0
	JZ   T3
	DEC  [I3] ; D
	JMP  T2
T3:
	LEA  EAX, [S44]; 44
	MOV  [I2], EAX ; C
	MOV  EAX, 4
	MOV  [I3], EAX ; D
	MOV  EAX, 4
	MOV  [I0], EAX ; A
	MOV  EAX, 0
	MOV  [I1], EAX ; B
	MOV  EAX, [I0]
	MOV  EBX, [I1]
	MOV  ECX, [I2]
	MOV  EDX, [I3]
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
I0			rd 1          ; A (0)
I1			rd 1          ; B (1)
I2			rd 1          ; C (2)
I3			rd 1          ; D (3)
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
; EAX			rd 1          ; EAX
; EBX			rd 1          ; EBX
; ECX			rd 1          ; ECX
; EDX			rd 1          ; EDX
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