Write a program that prompts the user to enter an integer n (<10) and
prints as pattern as follows:
For example, if the user enters n = 5, the output should be:

**********
*******
*****
***
*
.model small
.stack 100h
.data 
 msg dw "Enter An Integer Number (1-9): $" 
 n db ? 
 m db ?
.code
main proc
 mov ax,@data
 mov ds,ax
 
 mov ah,9
 lea dx, msg 
 int 21h
 mov ah,1
 int 21h
 sub al,30h
 mov n,al
 
 mov ah,2
 mov dl,0dh
 int 21h
 mov dl,0ah
 int 21h
 
 
 mov bl,1
 mov bh,1
 
 
 start: 
 mov cl,n 
 cmp bh,cl
 jg exit
 
 xor ax,ax
 mov al,n
 mov dl,2
 mul dl
 mov m,al
 mov al,bh
 mov dl,2

 mul dl 
 mov dl,al
 dec dl
 mov al,m
 sub al,dl
 mov cx,ax
 
 mov ah,2
 mov dl,'*' 
 loop2: 
 int 21h
 loop loop2
 
 mov ah,2
 mov dl,0dh
 int 21h
 mov dl,0ah
 int 21h
 
 xor ax,ax
 mov al,bh
 
 mov cx,ax
 mov ah,2 
 mov dl,' ' 
 loop3: 
 int 21h
 loop loop3 
 
 
 inc bh
 loop start
 ;exit the program
 exit:
 mov ah,4ch
 int 21h
 main endp
end main
