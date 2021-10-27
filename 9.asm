9. (asembly)  Nhập vào một số và tính giai thừa của số đó trên emu8086
;Nhap vao so va tinh giai thua 
.model small
.stack 100
.data
    muoi dw 10
    TB1 db 10,13,'KET QUA LA: $' 
.code
    main proc
        mov ax,@data
        mov ds,ax   ;khoi tao thanh ghi ds

        mov ah,1 ;nhap 1 ky tu tu ban phim
        int 21h  
        sub al,'0'  ;vd :chuyen ky tu'5' ve so 5 
        mov cx,0  ;cx=0
        mov cl,al  ;cl=5
        
        lea dx,TB1 ; in chuoi tb1
        mov ah,9
        int 21h
        ;1*2*3*4*5       
        mov ax,1;khoi tao ket qua ban dau =1
        mov bx,1 ;bien tang 
        
        Giaithua:  ;tinh giai thua tra ve 1 so
            Mul bx ;ax * bx luu vao trong ax
            inc bx  ;increase:tang gia tri bx len 1
            cmp bx,cx ;so sanh bx voi cx 
            jle giaithua ;neu bx<=cx thi tiep tuc lap
        mov cx,0
             
        Lappush: ;lay tu ky tu cua so 120 vao day vao trong ngan xep
            mov dx,0
            div muoi  ;chia cho 10
            add dx,'0' 
            push dx;day vao ngan xep
            inc cx ;increase : tang cx 1 don vi
            cmp ax,0
            jne Lappush
        
        Hienthi:  ;hien thi tuwng ky tu o trong ngan xep
            pop dx ;lay 1 so o dau ngan xep*
            mov ah,2
            int 21h
            Loop HienThi              
        mov ah,4Ch
        int 21h 
    main endp
end main
