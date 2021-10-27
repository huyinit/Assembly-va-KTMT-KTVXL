14.tổng chia hết cho 7:
.model small
.stack 100h
.data
mang1 db 7,5,60,233,77,43 
str1 db 'Tong: $'
.code

main proc
    mov ax,@data
    mov ds,ax
    
    lea si,mang1 
    mov bx,0
    mov dl,7
    
    
    tong: 
        mov al,[si]
        xor ah,ah 
        mov cx,ax
        inc si 
        cmp si,6
        je endtong
        
        div dl
        cmp ah,0
        jne tong
          
        add bx,cx
        jmp tong
    
    endtong:
    
    mov ax,bx
    call printNumber
    
    mov ah,4ch
    int 21h
    
main endp
    
;----------------------------------------
; print an integer number (MAX: 2550)
; input: AX: input number to print
printNumber proc
  push ax
  push bx
  push cx
  push dx

  ; check if AX is negative --> change to positive and print the minus sign (-)
  cmp ax, 0
  jge NOT_NEGATIVE    
  ; change to positive
  neg ax              
  ; print the minus sign
  mov dl, '-'
  call printCharacter
    
  ; divide the number by 10 to get the remainder and the quotient     
  NOT_NEGATIVE:
  mov bl, 10
  mov cx, 0
  StartSplit:
    div bl
    push ax   ; store the result into stack
    inc cx    ; count the number of digit
    cmp al, 0
    jz ExitSplit
    xor ah, ah
    jmp StartSplit
  ExitSplit:   
                              
  ; print each digit
  StartPrint:
    pop ax
    mov dl, ah
    call printSingleDigit
    loop StartPrint
  
  pop dx
  pop cx
  pop bx
  pop ax
  ret
printNumber endp
;----------------------------------------
; proc to print out a single digit number
; input: dl to contain the digit to print
printSingleDigit proc      
    push ax
    add dl, '0' ; digit to char
    mov ah, 2
    int 21H
    pop ax
    ret
printSingleDigit endp 
; --------------------------------------
; proc to print a string
; input: DX to contain the relative address of the string
printString proc 
  push ax   ; store AX into stack
  mov ah, 9
  int 21H
  pop ax    ; restore AX from stack
  ret
printString endp  

;----------------------------------------
; proc to print out a character
; input: dl to contain the character to print
printCharacter proc      
    push ax
    mov ah, 2
    int 21H
    pop ax
    ret
printCharacter endp

end main
