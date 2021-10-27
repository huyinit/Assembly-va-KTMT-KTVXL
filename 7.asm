7. (asembly) in chuỗi đảo ngược khi điền dấu # trên emu8086
;enter là 13 , esc là 27
.Model small
.Stack 100h
.Data      
    str db 50 dup ('$')   ; khoi tao chuoi 50 bytes
.code
main proc           
  mov ax,@Data
  mov ds,ax ;khoi tao thanh ghi ds 
  mov cx,0;gan gia tri cho thanh ghi cx=0
 START:      
  inc cx;increase tang cx len 1
  mov ah,1 ;nhap 1 ki tu
  int 21h
  cmp al,'#';so sanh al voi ki tu # => enter la 13
  je end ;jump equal :nhay den 'end' neu bang
  push ax ; them phan tu vao ngan xep 
  jmp START;nhay k dieu kien 
  
  end:;ket thuc     
    mov ah,2 ;in ky tu
    mov dl,0; in dau cach
    int 21h  

    dec cx;decrease:tru cx di 1
    pop dx;lay phan tu o dinh ngan xep dua vao dx     
    mov ah,2 ;in ky tu
    int 21h   
    
    cmp cx,1;so sanh cx voi 1
    jne end;jump not equal :nhay den 'end' neu khong bang      
    ;ve dos												
     Mov ah, 4Ch											
     Int 21h  
main endp
end 
