assume cs:code
data segment
	db 'Welcome to masm!',0
data ends

code segment
	start:  mov dh,8
		mov dl,3
		mov cl,2
		mov ax,data
		mov ds,ax
		mov si,0
		call show_str

		mov ax,4c00h
		int 21h
	show_str: 
		push dx
		push cx
		push si

		mov di,0
		mov bl,dh
		dec bl
		mov al,160
		mul bl
		mov bx,ax
		
		mov al,2
		mul dl
		add bl,al
		
		mov ax,0b800h
		mov es,ax

		mov al,cl		; 把颜色存在al中
	
	s:
		mov ch,0
		mov cl,ds:[si]
		jcxz ok 		；测试cx是否等于0如果等于0就jmp ok
		mov es:[bx+di],cl
		mov es:[bx+di+1],al
		add di,2
		inc si
		loop s
	ok:
		pop dx
		pop cx
		pop si
		ret
code ends
end start
