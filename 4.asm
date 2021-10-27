4. (asembly) Nhập một chuỗi và in ra trên emu8086

;nhap chuoi truoc , in thong bao và in chuoi sau
.model small
.stack 100
.data
    tb1 DB 10,13, 'chuoi da nhap la: $';10 xuong dong , 13 lui dau dong* 
    str DB 100 dup('$') ;
.code
    main proc
        mov ax, @data
        mov ds,ax ;khoi tao thanh ghi ds 
          
        ;nhap chuoi ky tu
        mov ah,10 ;    10=0ah
        lea dx,str ; tro den dia chi dau str
        int 21h 
        
        mov  ah,9 ;in mot xau ky tu   
        lea dx,tb1 ;
        int 21h   ;in ra
            
        ;dua dx chi ve phan tu thu 2 cua mang la  
        ; ky tu dau tien duoc nhap vao
        lea dx,str +2 ;256,5,h,e,l,l,o      
        int 21h  ;in na
        
        mov ah,4CH
        int 21h    
    main endp
 end
