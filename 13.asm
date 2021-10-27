13.UCLN, BCNN:
.model small
.stack 100h
.data
str1 db 'UCLN: $'
str2 db 10,13,'BCNN: $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov cl,7
    mov ch,9
    
    mov dl,cl
    mov dh,ch
    
    uc:
    cmp dl,dh
    je ucend
    jg ucln
    sub dh,dl 
    jmp uc
    ucln:
    sub dl,dh 
    jmp uc
    
    ucend:
    push dx
    mov ah,9
    lea dx,str1
    int 21h
    
    pop dx
    xor ah,ah
    mov al,dl
    push dx
    call printnum 
    
    
    
    mov ah,9
    lea dx,str2
    int 21h 
     
    mov al,cl
    mul ch 
    
    pop dx
    div dl
    call printnum
    
    
    
    mov ah,4ch
    int 21h
main endp

printnum proc 
    push ax
    push bx
    push cx
    push dx
    
    mov bl,10
    mov cx,0
    
    loopcat:
        div bl
        push ax
        inc cx
        cmp al,0
        je catexit
        xor ah,ah
        jmp loopcat
    
    catexit: 
    startprint:
        pop ax
        mov dl,ah 
        add dl,'0'
        mov ah,2
        int 21h
    loop startprint
    pop dx
    pop cx
    pop bx
    pop ax
    ret
printnum endp

end main
