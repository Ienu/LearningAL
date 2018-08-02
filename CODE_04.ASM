;实验9

assume cs:codesg, ds:datasg
datasg segment
	DB 'welcome to masm!'
datasg ends

codesg segment
start:	mov ax, 0B800H
	mov ds, ax
	mov si, 7C0H
	mov cx, 10H
	mov ax, datasg
	mov es, ax
	mov bx, 0
	mov ax, 0

s:	mov bx, ax
	mov ah, es:[bx]
	add bx, bx
	mov ds:[bx + si], ah
	mov byte ptr ds:[bx + si + 1], 2H

	add bx, 0a0H
	mov ds:[bx + si], ah
	mov byte ptr ds:[bx + si + 1], 00100100B

	add bx, 0a0H
	mov ds:[bx + si], ah
	mov byte ptr ds:[bx + si + 1], 01110001B
	mov ah, 0
	inc ax
	loop s

	mov ax, 4c00H
	int 21H

codesg ends
end start
