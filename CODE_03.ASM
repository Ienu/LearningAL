;实验7

assume cs:codesg, ds:data, es:table, ss:stack

data segment
	DB '1975', '1976', '1977', '1978', '1979', '1980', '1981', '1982', '1983'
	DB '1984', '1985', '1986', '1987', '1988', '1989', '1990', '1991', '1992'
	DB '1993', '1994', '1995'

	DD 16, 22, 382, 1356, 2390, 8000, 16000, 24486, 50065, 97479, 140417, 197514
	DD 345980, 590827, 803530, 1183000, 1843000, 2759000, 3753000, 4649000, 5937000

	DW 3, 7, 9, 13, 28, 38, 130, 220, 476, 778, 1001, 1442, 2258, 2793, 4037, 5635, 8226
	DW 11542, 14430, 15257, 17800

data ends

table segment
	DB 21 DUP ('year summ ne ?? ')
table ends

stack segment
	DB 8 DUP (0)
stack ends

codesg segment
start:	MOV AX, data
	MOV DS, AX

	MOV AX, table
	MOV ES, AX

	MOV AX, stack
	MOV SS, AX
	MOV SP, 8

	MOV CX, 15H
	MOV BX, 0

	MOV SI, 0
	MOV DI, 0

s0:	PUSH CX
	MOV CX, 4H

	MOV BX, 0

s1:	MOV AL, DS:[DI+BX]
	MOV ES:[SI+BX], AL
	INC BX
	LOOP s1

	MOV BX, 0
	MOV CX, 2H
	PUSH DI

s2:	MOV AX, SI
	PUSH BX
	MOV BL, 10H
	DIV BL
	POP BX	

	MOV AH, 0
	ADD AX, AX
	ADD AX, AX
	MOV DI, AX

	MOV AX, DS:[84+DI+BX]
	MOV ES:[5+SI+BX], AX
	INC BX
	INC BX
	LOOP s2

	POP DI

	MOV AX, SI
	PUSH BX
	MOV BL, 10H
	DIV BL
	POP BX

	PUSH DI
	MOV AH, 0
	ADD AX, AX
	MOV DI, AX

	MOV AX, DS:[168+DI]
	MOV ES:[10+SI], AX

	POP DI

	MOV AX, ES:[5+SI]
	MOV DX, ES:[7+SI]

	MOV BX, ES:[10+SI]

	DIV BX

	MOV ES:[13+SI], AX
	
	ADD SI, 10H
	ADD DI, 4H

	POP CX
	LOOP s0

	MOV AX, 4C00H
	INT 21H

codesg ends

end start
