8. (asembly)  Tìm giá trị lớn nhất của mảng 
.Model small
.Stack 100H
.Data                
list DB 1,2,3,4,5,6,7,8,0   
.code
main proc           
    ; initilize the ds and es registers
    mov ax, @Data ; 
    mov ds,ax ;           
    mov cx, 9                         
lea si, list       ; dua gia tri dauu tien cua chuoi vào si
    mov bl, [si]    ; dua dia chi si vào bl
    inc si               ; tang gia tri si them 1
Start:
    lodsb        
    cmp bl, al ; so sanh al va bl 
    jge BYPASS;   nhay denn BYPASS               
    mov bl, al;      neu al > bl thi gan bl = al;
    BYPASS:
    loop Start  ; lap
     
    ; print the max
    add bl, '0' ; 	ep kieu so ve kieu ke tu
    mov dl,bl   ; dua gia tri max bl vào dl;
    mov ah, 2  ; in ra màn hình
    int 21H
        
    mov ah, 4CH ; ket thuc chuong trinh
    int 21H
main endp
End Main
