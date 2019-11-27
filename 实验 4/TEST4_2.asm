assume cs:code

code segment
	mov ax, 0020H
	mov ds, ax
	mov bx, 0H
	mov cx, 40H
             s:mov ds:[bx], bx
	inc bx
	loop s
	mov ax, 4c00H
	int 21H
code ends
end