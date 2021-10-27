10. (asembly)  Chuyển một số từ hệ 10 sang hệ 2 trên emu8086
;10 => # 0 1 0 1 *  
.Model Small
.Stack 100
.Data
    tb1 DB 10, 13, 'So da nhap dang nhi phan: $'
    str DB 5 dup ('$'); nhap vao 1 chuoi toi da 5 ky tu
.Code
main proc
    MOV AX, @Data
    MOV DS, AX ;khoi tao thanh ghi ds
    
    MOV AX, '#' ;so sanh 
    PUSH AX  ;push dau # (acii) vao trong ngan xep
   ;Nhap so dang chuoi:    
    MOV AH, 10
    LEA DX, str ; nhap chuoi str  
    INT 21h
   ;Chuyen chuoi thanh so:
    MOV CL, [str+1] ; lay so ky tu cua chuoi ( vd :cl=2 )
    LEA SI, str+2 ; tro den dia chi cua ky tu dau tien cua chuoi str
    MOV AX, 0 ; ax=0 123
    MOV BX, 10 ;bx=10 ;he so nhan 
    thapphan:; chuyen chuoi thanh so     123;0*10+1 1*10+2; 12*10+3
        MUL BX  ;nhan 10
        MOV DL, [SI] ; dl='1'
        SUB DL, '0'; dl=1
        ADD AX, DX  ;ax=ax+dx
        INC SI ;increase tang si 1 down vi
        LOOP thapphan
   ;Chuyen thanh so nhi phan: 10- 1010
    MOV CL, 2 ; he so chia  
    
    nhiphan: ;chuyen so thap phan sang nhi phan va day cac so vao ngan xep
        MOV AH, 0  ;phan du =0
        DIV CL ; chia ax cho 2
        PUSH AX ; day ax vao ngan xep (al+ah)
        CMP AL, 0 ;so sanh thuong#0 tiep tuc chia
        JNE nhiphan  ;jump not eual
   
    MOV AH, 9
    LEA DX, tb1;in ra thb1  
    INT 21h 
    
    MOV AH, 2
    Inra:
        POP DX  ;lay tung phan tu trong ngan xep
        CMP DX, '#'
        JE Done  ;jump equal
        MOV DL, DH  ;lay duoc so tu ngan xep   :1 0 1 0
        ADD DL, '0' ; convert tu 1 so sang ky tu '1' '0' '1' '0'
        INT 21h
        JMP Inra
    Done:
        MOV AH, 4Ch
        INT 21h        
main endp
end
