Write a program that prompts the user to enter an integer n (<10) and
prints as pattern as follows:
For example, if the user enters n = 5, the output should be:

*
***
*****
*******
*********
.model small
.stack 100h
.data 
 msg dw "Enter An Integer Number (1-9): $" 
 n dw ? 
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
 xor ah,ah
 sub al,30h
 mov n,ax
 
 mov ah,2
 mov dl,0dh
 int 21h
 mov dl,0ah
 int 21h
 
 
 mov bx,1
 mov cx,n 
 
 start: 
 
 cmp cx,1
 je seg
 dec cx
mov ah,2
 mov dl," "
 loop2: 
 int 21h
 loop loop2 
 
 seg:
 mov cx,bx
 
 mov dl,'*' 
 loop3:
 int 21h
 loop loop3
 
 mov ah,2
 mov dl,0dh
 int 21h
 mov dl,0ah
 int 21h
 
 add bx,2
 mov cx,n 
 dec n
 loop start
 ;exit the program
 exit:
 mov ah,4ch
 int 21h
 main endp
end main
