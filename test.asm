format ELF executable
;================== code =====================
segment readable executable
start:
	CALL F6
;================== library ==================
exit:
	MOV EAX, 1
	XOR EBX, EBX
	INT 0x80

;=============================================

F4: ; sub1
	MOV  EAX, [reg_M]
	IMUL EAX, [reg_X]
	ADD  EAX, [reg_B]
	MOV  [reg_Y], EAX
	RET

F5: ; Bye
	MOV  EAX, 1
	MOV  [reg_A], EAX
	MOV  EAX, 0
	MOV  [reg_B], EAX
	MOV  EAX, [reg_A]
	MOV  EBX, [reg_B]
	MOV  ECX, [reg_C]
	MOV  EDX, [reg_D]
	INT  0x80
	RET

F6: ; main
	LEA  EAX, [S7]
	MOV  [reg_C], EAX
	MOV  EAX, 6
	MOV  [reg_D], EAX
	MOV  EAX, 4
	MOV  [reg_A], EAX
	MOV  EAX, 0
	MOV  [reg_B], EAX
	MOV  EAX, [reg_A]
	MOV  EBX, [reg_B]
	MOV  ECX, [reg_C]
	MOV  EDX, [reg_D]
	INT  0x80
	MOV  EAX, 12
	MOV  [reg_C], EAX
	MOV  EAX, 1
	ADD  EAX, [I1] ; Abc
	SUB  EAX, 3
	MOV  [reg_A], EAX
	MOV  EAX, [reg_C]
	CMP  EAX, 0
	CMP  EAX, 0
	JNZ  T1
	MOV  EAX, 4
	MOV  [reg_A], EAX
	MOV  EAX, 0
	MOV  [reg_B], EAX
	LEA  EAX, [S9]
	MOV  [reg_C], EAX
	MOV  EAX, 4
	MOV  [reg_D], EAX
	MOV  EAX, [reg_A]
	MOV  EBX, [reg_B]
	MOV  ECX, [reg_C]
	MOV  EDX, [reg_D]
	INT  0x80
	RET
T1:
	MOV  EAX, [reg_A]
	IMUL EAX, [reg_B]
	CDQ
	IDIV [reg_C]
	MOV  [reg_B], EAX
	MOV  EAX, [reg_I]
	ADD  EAX, 1
	MOV  [reg_I], EAX
	MOV  EAX, 13
	MOV  [reg_M], EAX
	MOV  EAX, 2
	MOV  [reg_X], EAX
	MOV  EAX, 100
	MOV  [reg_B], EAX
	CALL F4 ; sub1
	MOV  EAX, [reg_A]
	ADD  EAX, 3
	ADD  EAX, [I10] ; yyy
	MOV  [I0], EAX ; xxx
	INC  [reg_D]
	DEC  [I0] ; xxx
	MOV  EAX, [reg_Y]
	INC  [reg_Y]
	MOV  [reg_X], EAX
	MOV  EAX, [reg_Y]
	DEC  [reg_Y]
	MOV  [reg_Z], EAX
	MOV  EAX, [I0] ; xxx
	INC  [I0] ; xxx
	MOV  [reg_Y], EAX
	MOV  EAX, [I0] ; xxx
	DEC  [I0] ; xxx
	MOV  [reg_Z], EAX
	LEA  EAX, [C3]
	MOV  [reg_C], EAX
	LEA  EAX, [S11]
	MOV  [reg_C], EAX
	MOV  EAX, 5
	MOV  [reg_D], EAX
	MOV  EAX, 4
	MOV  [reg_A], EAX
	MOV  EAX, 0
	MOV  [reg_B], EAX
	MOV  EAX, [reg_A]
	MOV  EBX, [reg_B]
	MOV  ECX, [reg_C]
	MOV  EDX, [reg_D]
	INT  0x80
	MOV  EAX, 500
	IMUL EAX, 1000
	IMUL EAX, 1000
	MOV  [reg_D], EAX
T2:
	MOV  EAX, [reg_D]
	CMP  EAX, 0
	JZ   T3
	DEC  [reg_D]
	JMP  T2
T3:
	LEA  EAX, [S14]
	MOV  [reg_C], EAX
	MOV  EAX, 4
	MOV  [reg_D], EAX
	MOV  EAX, 4
	MOV  [reg_A], EAX
	MOV  EAX, 0
	MOV  [reg_B], EAX
	MOV  EAX, [reg_A]
	MOV  EBX, [reg_B]
	MOV  ECX, [reg_C]
	MOV  EDX, [reg_D]
	INT  0x80
	RET
;================== data =====================
segment readable writeable
;=============================================
; symbols: 1000 entries, 15 used
; ------------------------------------
S7			db 104,101,108,108,111,33,0
S9			db 47,48,33,10,0
S11			db 32,46,46,46,32,0
S14			db 98,121,101,10,0
I0			rd 1          ; xxx
I1			rd 1000000    ; Abc
C2			rb 1          ; yyy
C3			rb 256        ; Def
I10			rd 1          ; yyy
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