12.TỔNG CÁC CHỮ SỐ
.model small
	.stack 50
	.data
	       so db 10,0,10 dup($) 
	       tb1 db 'Nhap so: $'
	       tb2 db 10,13,'Tong cac chu so: $'
	       Tong db 0   
	       muoi db 10
	.code
	    main proc
	        mov ax,@data
	        mov ds,ax
	        
	        lea dx,tb1
	        mov ah,9
	        int 21h
	        ;nhap so vao
	        lea dx,so
	        mov ah,0Ah
	        int 21h 
	        
	        xor cx,cx
	        lea si,so+2
	        mov cl,[so+1]
	        
	        xor ax,ax
	        Lap:
	            xor bx,bx
	            mov bl,[si]
	            sub bl,30h
	            add ax,bx
	            inc si
	            loop Lap
	        
	        
	        xor cx,cx
	        lapchia:
	            xor dx,dx
	            div muoi
	            add ah,30h
	            mov dl,ah
	            push dx
	            inc cx
	            xor ah,ah
	            cmp ax,0
	            jne lapchia
	        
	        lea dx,tb2
	        mov ah,9
	        int 21h
	        Hienthi:
	            pop dx
	            mov ah,2
	            int 21h
	            loop Hienthi
	        mov ah,4Ch
	        int 21h
	    main endp
	    end main
