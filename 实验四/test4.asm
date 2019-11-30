assume cs:code
code segment
	mov ax, 0000H
	mov ds, ax
	mov bx, 200H
	mov dx, 0H
	mov cx, 40H
              s:mov ds:[bx], dx
	inc dx
	inc bx
	loop s
	
	mov ax, 4c00H
	int 21h
code ends
end