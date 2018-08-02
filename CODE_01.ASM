;CODE01 实验4 (1)
;向内存0:200~0:23F依次传送数据0~63(3FH)

assume cs:code
code segment

start:	MOV AX, 20H
	MOV DS, AX

	MOV BX, 0
	MOV CX, 40H

s:	MOV DS:[BX], BL
	INC BX
	LOOP s

	MOV AX, 4C00H
	INT 21H

code ends
end start
