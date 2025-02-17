;
; DA1B.asm
;
; Created: 9/21/2019 5:48:38 PM
; Author : Henry M
;
.include<m328pbdef.inc>

.EQU STARTADDS = 0x0200 
.ORG 0x0200

	;MATCHING VALUES FROM ADDRESS TO REGISTERS
	LDI XL, LOW(STARTADDS)
	LDI XH, HIGH(STARTADDS)
	LDI YL, LOW(0x0300)
	LDI YH, HIGH(0x0300)
	LDI ZL, LOW(0x0500)
	LDI ZH, HIGH(0x0500)
	;INITIALIZING COUNTER TO R16
	LDI R20, 250
	;STARTING VALUES FROM 10 TO 260 CONSECUTIVELY 
	LDI R21, 10
;STARTING TO LOAD VALUES INTO X-REGISTER 
CALC:
	ST X+, R21
	MOV R22, R21
	RJMP CHECK_DIV
;LOOP CHECKING IF NUMBER IS DIVISIBLE BY 5
CHECK_DIV:
	SUBI R22, 5
	BRLO NO_DIVIS ;IF RESULT IS LESS THAN 0 GO TO NOT DIVISIBLE 
	BREQ DIVIS	  ;IF RESULT IS 0 THEN GO TO DIVISIBLE 
	RJMP CHECK_DIV  

;IF DIVISIBLE BY 5 STORE IN Y STARTING AT THE LOWEST BIT
DIVIS:
	ST  Y+, R21
	ADD R16, R21 ;ADD NUMBER TO R16
	ADC R17, R23 ;ADD CARRY IF ANY TO R17
	JMP LOOP
;IF NOT DIVISIBLE BY 5 STORE IN Z STARTING AT THE LOWEST BIT
NO_DIVIS:
	ST Z+, R21
	ADD R18, R21 ;ADD NUMBER TO R18
	ADC R19, R23 ; ADD CARRY IF ANY TO R19
	RJMP LOOP
;COUNTER LOOP
LOOP:
	INC R21 ; INCREMENT FROM SET VALUE
	DEC R20 ; DECREMENT FROM 250
	BRNE CALC ;IF R20 DOES NOT EQUAL ZERO KEEP LOOPING 
;ADDING FINAL RESULTS STORED
ADDITION:
	ADD R16, R18
	ADC R17, R19

END: JMP END ;END OF PROGRAM



