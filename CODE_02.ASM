;问题7.9
;将datasg段中每个单词的前四个字母改为大写字母

assume cs:codesg, ss:stacksg, ds:datasg

stacksg segment
	DW 0, 0, 0, 0, 0, 0, 0, 0
stacksg ends

datasg segment
	DB '1. display      '
	DB '2. brows        '
	DB '3. replace      '
	DB '4. modify       '
datasg ends

codesg segment
start:	MOV AX, stacksg
	MOV SS, AX
	MOV AX, datasg
	MOV DS, AX
	MOV SI, 0
	MOV CX, 4

s0:	PUSH CX
	MOV CX, 4
	MOV BX, 0

s:	MOV AL, DS:[SI+BX+3]
	AND AL, 11011111B
	MOV DS:[SI+BX+3], AL
	INC BX
	LOOP s

	POP CX
	ADD SI, 10H
	LOOP s0

	MOV AX, 4C00H
	INT 21H
codesg ends

end start
