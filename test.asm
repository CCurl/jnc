; 0 instructions removed
format ELF executable
;================== code =====================
segment readable executable
start:
	LEA  EBP, [locals]
	CALL F11
;================== library ==================
exit:
	MOV EAX, 1
	XOR EBX, EBX
	INT 0x80

;=============================================

F9: ; func
	MOV  EAX, 128
	PUSH EAX
	MOV  EAX, 17
	MOV  ECX, 111
	MOVZX  EBX, [C5 + ECX] ; y
	ADD  EAX, EBX
	POP  ECX
	MOV  [C5 + ECX], AL ; y
	MOV  EAX, 77
	PUSH EAX
	MOV  EAX, 99
	MOV  ECX, [I6] ; a
	MOV  EBX, [I6 + ECX*4] ; a
	ADD  EAX, EBX
	POP  ECX
	MOV  [I6 + ECX*4], EAX ; a
	MOV  EAX, [EBP+8]
	MOV  EBX, 3
	IMUL EAX, EBX
	MOV  EBX, [EBP+4]
	ADD  EAX, EBX
	MOV  [EBP+0], EAX
	RET

F10: ; pushA
	MOV  EAX, [I4] ; stk
	MOV  EBX, 1
	ADD  EAX, EBX
	MOV  [I4], EAX ; stk
	MOV  EAX, [I4] ; stk
	PUSH EAX
	MOV  EAX, [I6] ; a
	POP  ECX
	MOV  [I4 + ECX*4], EAX ; stk
	RET

F11: ; main
	ADD  EBP, 40
	MOV  EAX, 4
	MOV  [EBP+4], EAX
	MOV  EAX, 5
	MOV  [EBP+8], EAX
	CALL F9 ; func
	MOV  EAX, [EBP+0]
	MOV  [I6], EAX ; a
	SUB  EBP, 40
	MOV  EAX, [I6] ; a
	MOV  [C8], AL ; b
	MOV  EAX, [I6] ; a
	INC  [I6] ; a
	PUSH EAX
	MOV  EAX, 97
	POP  ECX
	MOV  [C5 + ECX], AL ; y
	MOV  EAX, 2
	PUSH EAX
	MOV  EAX, [I6] ; a
	MOV  EBX, 223
	ADD  EAX, EBX
	POP  ECX
	MOV  [C5 + ECX], AL ; y
	MOV  EAX, [I6] ; a
	PUSH EAX
	MOV  EAX, 123
	POP  ECX
	MOV  [C5 + ECX], AL ; y
	MOV  EAX, [I6] ; a
	MOV  EBX, 1
	ADD  EAX, EBX
	PUSH EAX
	MOV  EBX, 0
	POP  ECX
	MOV  [C5 + ECX], AL ; y
	CALL F10 ; pushA
	MOV  EAX, [I6] ; a
	MOV  EBX, 1
	ADD  EAX, EBX
	MOV  [I6], EAX ; a
	CALL F10 ; pushA
	RET
;================== data =====================
segment readable writeable
;=============================================
; symbols: 1000 entries, 12 used
; ------------------------------------
I4			rd 100        ; stk (4)
C5			rb 256        ; y
I6			rd 1          ; a (6)
I7			rd 1          ; a1 (7)
C8			rb 1          ; b
locals		rd 400
