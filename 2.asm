2: (asembly) Nhập 1 ký tự và xuất ra màn hình trên emu8086
.model small												
.stack													
.data													
    TBao1   db    "Hay nhap mot ky tu: $"  ;khoi tao xau						
    TBao2   db    13,10,"Ky tu da nhap: $"							
    output    db    ? ;khoi tao bien KyTu khong co gia tri ban dau*					
.code													
    main proc												
        Mov ax,@data    ;khoi dau thanh ghi DS							
        Mov ds,ax   ;tro thanh ghi ds ve dau doan data							
        
        ;in ra man hinh xau TBao1									
        Lea dx, TBao1   ;dua con tro toi dia chi cua TBao1						
        Mov ah, 9   ;su dung ham ngat 9 cua ngat INT 21h    						    
        int 21h       											
                ;nhap vao 1 ki tu tu ban phim		*						
        Mov ah, 1   ;su dung ham ngat 1 cua ngat INT 21h 						      
        Int 21h     											
        Mov output, al;gan gia tri vua nhap (duoc luu o AL) vao bien KyTu				
        
        ;in ra man hinh xau TBao2									
        lea dx, TBao2											
        mov ah, 9       											
        int 21h												
        
        ;hien thi ky tu da nhap											
        Mov ah, 2    ;su dung ham ngat 2 cua ngat INT 21h  						    
    	Mov dl, output    ;Hien thi ra man hinh ky tu da luu o DL		
        Int 21h												
        
        ;ve dos												
        Mov ah, 4Ch											
        Int 21h  												
    main endp												
End			
