assume cs:codesg,ss:stacksg,ds:datasg

stacksg segment
	dw 0,0,0,0,0,0,0,0
stacksg ends

datasg segment
	db '1. display      '
	db '2. brows        '
	db '3. replace      '
	db '4. modify       '
datasg ends

codesg segment
	start:mov ax,datasg
	mov ds,ax
	mov bx,0

	mov ax, stacksg
	mov ss,ax
	mov sp,10H
	
	mov cx,4
	s:push cx
	mov si,0
	mov cx,4
	s0:mov al, 3[bx][si]
	and al,11011111b
	mov 3[bx][si],al
	inc si
	loop s0
	add bx,10H
	pop cx
	loop s

	mov ax,4c00H
	int 21H
codesg ends

end start