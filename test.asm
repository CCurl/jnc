
; 13 instructions removed
format ELF executable
;================== code =====================
segment readable executable
start:
	LEA  EBP, [regs]
	CALL F41
;================== library ==================
exit:
	MOV EAX, 1
	XOR EBX, EBX
	INT 0x80

;=============================================

F30: ; strLen
	MOV  EAX, [EBP+8]
	MOV  [EBP+12], EAX
T1:
	MOV  EAX, [EBP+12]
	CMP  BYTE [EAX], 0
	JZ   T2
	INC  DWORD [EBP+12]
	JMP  T1
T2:
	MOV  EAX, [EBP+12]
	SUB  EAX, DWORD [EBP+8]
	MOV  [EBP+12], EAX
	RET

F33: ; print
	CALL F30 ; strLen
	MOV  EAX, 0
	MOV  [EBP+4], EAX
	MOV  EAX, 4
	MOV  [EBP+0], EAX
	MOV  EAX, EAX
	MOV  EBX, EBX
	MOV  ECX, ECX
	MOV  EDX, EDX
	INT  0x80
	RET

F34: ; Bye
	MOV  EAX, 1
	MOV  [EBP+0], EAX
	MOV  EAX, 0
	MOV  [EBP+4], EAX
	MOV  EAX, EAX
	MOV  EBX, EBX
	MOV  ECX, ECX
	MOV  EDX, EDX
	INT  0x80
	RET

F35: ; MXB
	MOV  EAX, [EBP+48]
	IMUL EAX, DWORD [EBP+92]
	ADD  EAX, DWORD [EBP+4]
	MOV  [EBP+96], EAX
	RET

F36: ; BM
	ADD  EBP, 104
	LEA  EAX, [S37]; 37
	MOV  [EBP+8], EAX
	CALL F33 ; print
	MOV  EAX, 1000
	IMUL EAX, 1000
	IMUL EAX, 1000
	MOV  [EBP+12], EAX
T3:
	MOV  EAX, [EBP+12]
	CMP  EAX, 0
	JZ   T4
	DEC  DWORD [EBP+12]
	JMP  T3
T4:
	LEA  EAX, [S40]; 40
	MOV  [EBP+8], EAX
	CALL F33 ; print
	SUB  EBP, 104
	RET

F41: ; main
	LEA  EAX, [S42]; 42
	MOV  [EBP+8], EAX
	CALL F33 ; print
	CALL F36 ; BM
	MOV  EAX, 1
	MOV  [EBP+8], EAX
	MOV  EAX, 1
	ADD  EAX, [I27] ; Abc
	SUB  EAX, 3
	MOV  [EBP+0], EAX
	MOV  EAX, [EBP+8]
	XOR  EDI, EDI
	CMP  EAX, 0
	JE   @F
	DEC  EDI
@@:	MOV  EAX, EDI
	CMP  EAX, 0
	JNZ  T5
	LEA  EAX, [S44]; 44
	MOV  [EBP+8], EAX
	CALL F33 ; print
	RET
T5:
	MOV  EAX, [EBP+0]
	IMUL EAX, DWORD [EBP+4]
	CDQ
	IDIV DWORD [EBP+8]
	MOV  [EBP+4], EAX
	MOV  EAX, [EBP+32]
	ADD  EAX, 1
	MOV  [EBP+32], EAX
	MOV  EAX, 13
	MOV  [EBP+48], EAX
	MOV  EAX, 2
	MOV  [EBP+92], EAX
	MOV  EAX, 100
	MOV  [EBP+4], EAX
	CALL F35 ; MXB
	MOV  EAX, [EBP+0]
	ADD  EAX, 3
	ADD  EAX, [I45] ; yyy
	MOV  [I26], EAX ; xxx
	INC  DWORD [EBP+12]
	DEC  [I26] ; xxx
	MOV  EAX, [EBP+96]
	INC  DWORD [EBP+96]
	MOV  [EBP+92], EAX
	MOV  EAX, [EBP+96]
	DEC  DWORD [EBP+96]
	MOV  [EBP+100], EAX
	MOV  EAX, [I26] ; xxx
	INC  [I26] ; xxx
	MOV  [EBP+96], EAX
	MOV  EAX, [I26] ; xxx
	DEC  [I26] ; xxx
	MOV  [EBP+100], EAX
	LEA  EAX, [C29]; 29
	MOV  [EBP+8], EAX
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
regs		rd 1040