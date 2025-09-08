format ELF executable
;================== code =====================
segment readable executable
start:
	CALL F5
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

F5: ; main
	MOV  EAX, 123
	MOV  [reg_C], EAX
	MOV  EAX, 1
	ADD  EAX, [I1] ; Abc
	SUB  EAX, 3
	MOV  [reg_A], EAX
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
	MOV  EAX, [reg_A]
	ADD  EAX, 3
	ADD  EAX, [I6] ; yyy
	MOV  [I0], EAX ; xxx
	RET
;================== data =====================
segment readable writeable
;=============================================
; symbols: 1000 entries, 7 used
; ------------------------------------
I0			rd 1          ; xxx
I1			rd 1000000    ; Abc
C2			rb 1          ; yyy
C3			rb 256        ; Def
I6			rd 1          ; yyy
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