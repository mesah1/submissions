; DA1A.asm
;
; Created: 9/19/2019 9:20:55 PM
; Author : Henry M
;
.include<m328pbdef.inc>

.ORG 0
;INITIALIZING REGISTERS
	LDI R25,0b00110101
	LDI R24,0b10001110
	LDI	R23,0b00000010
	LDI R22,0b01001010
	LDI R20,0x00
	LDI R19,0x00
	LDI R18,0x00
	LDI R17,0x00

;INSTRUCTIONS
L1:
	ADD R17,R24
	BRCS FLAG1
	DEC R22
	BRNE L1
	JMP DEC2
L2:
	ADD R18,R25
	BRCS FLAG2
	COM R23
	DEC R23
	JMP L2

DEC2:
	COM R23
	DEC R23
	ADD R17,R24
	BRCS FLAG1B
	BRCC L1
DEC2B:
	DEC R23
	ADD R18,R25
	BRCS FLAG1B
	BRCC L2
		
FLAG1: 
	INC R18
	ADD R18,R25
	BRCS FLAG2
	DEC R22
	BRNE L2
	JMP DEC2B
FLAG1B: 
	INC R18
	ADD R18,R25
	BRCS FLAG2
	DEC R22
	BRNE L2
	JMP DEC2
FLAG2:
	INC R19
	ADD R19,R25
	BRCS FLAG3
FLAG3:
	INC R20
	ADD R20,R25
	COM R23
	DEC R23
	BREQ FLAG3
	LDI R20,0x00
END:	JMP END
