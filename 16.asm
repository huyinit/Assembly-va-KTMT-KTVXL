16. (asembly)  Đếm chiều dài 1 chuỗi trên emu8086
.MODEL small
.STACK 100
.DATA
    tb1 DB "Nhap vao 1 chuoi: $"
    tb2 DB 10,13,"Tong chieu dai cua chuoi: $"
    s DB 100 dup("$")  ;chuoi nhap vao
    ;byte 0: chua so ki tu toi da cua xau nhap vao 
    ;byte 1: chua chieu dai cua xau vd :123456789 => 9
    ;byte 2: Chua dia chi cua ky tu dau tien
.CODE

MAIN:
    MOV AX, @DATA
    MOV DS,AX ;khoi tao thanh ghi ds
    
    
    LEA DX,tb1 ;xuat chuoi tb1
    MOV AH,9
    INT 21h 
    
    LEA DX,s 
    MOV AH,10 ;nhap chuoi s
    INT 21h 
    
    LEA DX,tb2
    MOV AH,9 ;xuat chuoi tb2
    INT 21h  
    
    ;Tinh chieu dai chuoi
    mov ax,0
    MOV AL,s+1  ;Chuyen chieu dai chuoi vao ax  al=9
    MOV CX,0    ;Khoi tao bien dem cx=0(count)
    MOV BX,10 ;khoi tao so chia
    ;123 push 3 2 1 =>pop 1 2 3
LapDem1:; day cac so vao ngan xep
    MOV DX,0  ;khoi tao phan du bang 0
    DIV BX ; chia 10
    PUSH DX ; lay dx la phan du day vao ngan xep
    INC CX ;tang cx len 1 don vi
    CMP AX,0 ;so sanh ax phan thuong  khac 0 thi tiep tuc vong lap
    JNZ LapDem1   ;jump not zezo
    ;xuat chieu dai chuoi
   
LapDem2: ; lay cac so tu ngan xep ra
    POP DX ;Chua so du trong phep chia
    ADD DX,'0' ;chuyen chu so -> ky tu so  
    MOV AH,2
    INT 21H
    LOOP LapDem2  
    
    MOV AH,4ch
    INT 21h
END MAIN  
End
