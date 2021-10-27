15.Tổng 2 số kiểu word
.model tiny
.stack 100h
.data
tb1 db ‘nhap so thu 1:$’
tb2 db 13,10 ,’nhap so thu 2:$’
tb3 db 13,10,’tong 2 so$’
so1 dw 0
so2 dw 0
tong dw 0
.code
main proc
mov ax,@data
mov ds,ax
;in thong bao nhap so thu nhat
lea dx,tb1
mov ah,9
int 21h
nhap1:
mov ah,1
int 21h
cmp al,13 ;so sanh ky tu vua nhap voi 13
je nhap2 ;neu bang nhap so thu 2
sub al,30h ;doi ky tu sang so
mov ah,0 ;xoa bit cao
mov cx,ax ;cat so vua nhap vào cx
mov ax,so1 ;dua bien sô 1 vê kiêu byte de chuan bi nhann vói 10
mov bx,10 ;gan bx =10
mul bx ; nhân ax voi 10
add ax,cx ;công ket qua vua nhan voi so vua nhap ket qua cât vào ax
mov so1,ax ; cat kêt qua vao bién sô1
jmp nhap1
nhap2:
lea dx,tb2 ;hiên thông báo nhâp sô thu 2
mov ah,9
int 21h
nhap: mov ah,1 ;nhap sô thu 2
int 21h
cmp al,13 ;so sánh ký tu vua nhâp voi 13
je tinhtong ;nêu bang thì tính tông
sub al,30h ;chuyên ký tu sang dang sô
mov ah,0 ;xoá bít cao
mov cx,ax ;cât kêt qua vua nhap vào cx
mov ax,so2 ;dua biên sô 2 vê kiêu byte
mov bx,10 ;gan bx=10
mul bx ;nhân kêt qua vua nhap voi 10
add ax,cx ;công kêt qua vua nhân vói sô vua nhâp
mov so2,ax ;cât kêt qua vào biên sô 2
jmp nhap
tinhtong:
mov dx,tong
mov ax,so1 ;dua biên sô 1 ra thanh ghi ax
mov bx,so2 ;dua biên só 2 ra thanh ghi bx
add ax,bx ;công ax voi bx kêt qua cat vao ax
mov tong,ax ;dua kêt qua tu ax vào biên tông
inso: mov ah,9 ;hiên thông báo in tông
lea dx,tb3
int 21h
mov ax,tong ;dua kêt qua trongv bien tông ra thanh ghi ax
mov dx,0 ;xoa bit cao dx
mov bx,10 ;gán bx=10
mov cx,0 ;khoi tao biên dêm
chia: div bx ;lây kêt qua chia cho 10
push dx ;du o dx dây vao ngan xêp
inc cx ;tang biên dêm
cmp ax,0 ;so sanh thuong voi 0
je hienkq ;neu bang thì hiên kêt qua
xor dx,dx ;xoa bit cao trong dx
jmp chia
hienkq: pop dx ;lây du trong ngan xêp ra khoi dx
add dl,30h ;chuyên sô thành dang ký tu
mov ah,2 ;in tông
int 21h
loop hienkq
ra: mov ah,4ch
int 21h
Main endp
End main
