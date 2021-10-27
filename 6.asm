6. (asembly) IN CHUỖI ĐẢO NGƯỢC trên emu8086
.model small
.stack 100
.data 
     str DB 50 dup('$') ;str gom 50 bytes chua 50 gia tri khoi dau 
     tb1 db 10,13,'Chuoi da duoc dao nguoc: $' 
.code
    main proc
        mov ax,@data
        mov ds,ax  ;khoi tao thanh ghi ds
        
        ;nhap xau ki tu 
        lea dx,str
        mov ah,10;0Ah
        int 21h  
        
        ;in chuoi tb2 ra man hinh
        lea dx, tb1
        mov ah,9
        int 21h
        
        ;vd 123456789 =>len=9   256,9,1,2,3....
        mov cl,[str + 1] ;chuyen chieu dai chuoi vua nhap vao cl
        lea si,[str + 2] ;dua si chi ve phan tu thu 2 cua mang la ky tu dau tien duoc nhap vao
        Lap:;day cac ky tu vao ngan xep
            push [si];dua phan tu ma si dang chi den vao dau ngan xep
            inc si  ;increase :tang gi tri cua si len 1 
            loop Lap
        
        mov cl, [str + 1];chuyen chieu dai chuoi vua nhap vao cl        
        Lap2: ;lay du lieu tu ngan xep
            pop dx  ;lay gia tri tren dinh ngan xep dua vao dx  
            mov ah,2 ;in ki tu vua lay ra man hinh
            int 21h
            Loop Lap2
        
        ; tro ve DOS dùng hàm 4 CH cua INT 21H
		MOV AH, 4CH
		INT 21H
    main endp
end
