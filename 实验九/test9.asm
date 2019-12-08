assume cs:codesg,ds:datasg,ss:stacksg
datasg segment
	db 'welcome to masm!'
	db 02h,24h,71h        
datasg ends

stacksg segment
	dw 16 dup(0)
stacksg ends

codesg segment
start:
	mov ax,datasg
	mov ds,ax

	mov ax,stacksg
	mov ss,ax
	mov sp,0
	
	mov ax,0B800H
	mov es,ax

	mov si,10H
	mov ax,0
	mov cx,3
	s:
		mov ah,ds:[si]
		push cx
		push si
		
		mov cx,16
		mov si,0
		mov bx,0
		mov di,1
	s1:
		mov al,ds:[bx]
		mov es:[bx+si],al
		mov es:[bx+di],ah

		inc bx
		inc si
	  	inc di
	loop s1
		pop si
		inc si
		pop cx
		mov dx,es
		add dx,0AH
		mov es,dx
	loop s
	
	mov ax,4c00H
	int 21H
codesg ends

end start

