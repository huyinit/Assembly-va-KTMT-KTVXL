5. (asembly) Nhập chuỗi thành chuỗi thường và chuỗi hoa trên emu8086
.Model Small
.Stack 100h
.Data
str DB 256 dup('$') ;khoi tao chuoi str
tb1 DB 10, 13, 'Chuyen sang chuoi in thuong: $'
tb2 DB 10, 13, 'Chuyen sang chuoi in hoa: $'
.Code
main proc
    MOV AX, @Data
    MOV DS, AX ;khoi tao thanh ghi ds
     
    ;Nhap chuoi:
    LEA DX, str  ;tro den dia chi chuoi str
    MOV AH, 10  ; nhap xau ngat 10
    INT 21H 
    
    ;In thong bao 1
    MOV AH, 9   
    LEA DX, tb1  ;hien xau tb1
    INT 21H
    CALL inthuong  ;hien xau str chu thuong
    
    ;In chuoi in hoa:
    MOV AH, 9
    LEA DX, tb2 ;hien thong bao tb2
    INT 21H
    CALL inhoa  
    
    MOV AH, 4ch
    INT 21H
main endp 

inthuong proc
    LEA SI, str+2 ;
    Lap1:  ;1 xau : kiem tra tung ky tu mot 
        MOV DL, [SI]
        CMP DL, 'A' ;compare
        JL In1  ;jump less
        CMP DL, 'Z' ;compare
        JG In1   ;jump greater
        ADD DL, 32  ;chuyen ky tu hoa thanh thuong
    In1:
        MOV AH, 2 ;in ky tu
        INT 21H
        INC SI  ;increase
        CMP [SI], '$' ;compare
        JNE Lap1 ;jump not equal
   RET  ;return
inthuong endp     

inhoa proc
    LEA SI, str+2
    Lap2:
        MOV DL, [SI]
        CMP DL, 'a'
        JL In2
        CMP DL, 'z'
        JG In2
        SUB DL, 32  ;chuyen ky tu hoa thanh ky tu thuong
    In2:
        MOV AH, 2
        INT 21H
        INC SI
        CMP [SI], '$'
        JNE Lap2
    RET
inhoa endp
end
