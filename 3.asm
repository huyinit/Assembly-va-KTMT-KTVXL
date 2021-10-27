3. (asembly) nhập kí tự thường và chuyển sang kí tự hoa trên emu8086
;nhap ky tu truoc sau do in chuoi và ky tu hoa sau
.MODEL SMALL											
.STACK 100h												
.DATA												
   tb2 DB 13,10,'Chuyen sang ki tu hoa la : $'							
   Char DB ?,'$'											
 .CODE												
Main PROC												
    MOV AX,@DATA											
    MOV DS,AX											
    ;Nhap vao 1 ky tu thuong										
    MOV AH,1        ;Su dung ngat 1 cua ngat INT 21h de doc 1 ki tu va luu vao AL		
    INT 21h         											
    SUB AL,20h      ;Doi thanh ki tu hoa								
    MOV Char,AL     ;gan gia tri vua nhap (luu o AL) vao bien Char					
    
    ;In ra thong bao tb2 							
    LEA DX,tb2											
    MOV AH,9 											
    INT 21h  
    
    LEA DX,char											
    MOV AH,9 											
    INT 21h
										
    ;Ket thuc chuong trinh										
   MOV AH,4Ch											
   INT 21h												
Main ENDP												
END	
