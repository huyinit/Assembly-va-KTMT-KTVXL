11. (asembly)  Chuyển một số từ hệ 10 sang hệ 16 trên emu8086
;11: he 10 sang 16 444=>1BC  
;444=1*16^2 + 11*16 + 12*16     *
.model small
.stack 100h
.data
.code
main proc
    mov ax,@data
    mov ds,ax;khoi tao thanh ghi ds    
    mov ax,444 ;chuyen 444 he 10v vao thanh ghi ax=> sang he 16
    call printnum16 ;chuyen den ham printnum16    
    mov ah,4ch
    int 21h            
main endp

printnum16 proc
    mov bx,16   ;khoi tao bl bang 16     
    mov cx,0    ;khoi tao bien dem  
    
    hexa: ;xay dung duoc stack
        div bl  ;lay so hien tai chia cho 16 
        push ax ;day gia tri ax vao ngan xep
        inc cx  ;tang bien dem them 1
        cmp al,0    ;neu thuong (thuong al cua lenh div) bang 0 thi ket thuc (ket thuc startsplit)
        je ketqua  ;jum equal
        mov ah,0   ;clear ah (xoa phan du cua lenh div) va quay lai tiep tuc chia (quay lai startsplit)
        jmp hexa  
        
    ketqua:    
    inkt:
        pop ax  ;lay tung gia tri o dinh ngan xep vua day vao o ham startsplit
        mov dl,ah   ;lay phan du chuyen vao dl
        
        cmp dl,10   ;neu phan du la 10 thi chuyen den ham in ky tu A    
        je hex_a 
        cmp dl,11   ;neu phan du la 11 thi chuyen den ham in ky tu B
        je hex_b
        cmp dl,12   ;neu phan du la 12 thi chuyen den ham in ky tu C
        je hex_c
        cmp dl,13   ;neu phan du la 13 thi chuyen den ham in ky tu D
        je hex_d
        cmp dl,14   ;neu phan du la 14 thi chuyen den ham in ky tu E
        je hex_e
        cmp dl,15   ;neu phan du la 15 thi chuyen den ham in ky tu F
        je hex_f 
        
        add dl,'0'  ;(neu khong la ky tu A->F) chuyen cac so tu 0-9 sang ascii
        jmp print  ;nhay den ham in de in so tu 0-9
        
        hex_a:  
            mov dl,'A'
            jmp print     
        hex_b:  
            mov dl,'B'
            jmp print
        hex_c:  
            mov dl,'C'
            jmp print
        hex_d: 
            mov dl,'D'
            jmp print
        hex_e:  
            mov dl,'E'
            jmp print  
        hex_f:  
            mov dl,'F' 
            jmp print 
     print: ;in 1 ky tu ra man hinh 
        mov ah,2
        int 21h        
    loop inkt
    ret ;return
printnum16 endp
end
