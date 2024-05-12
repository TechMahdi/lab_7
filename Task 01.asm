Write a program that prompts the user to enter an integer n (<10) and
prints as pattern as follows:
For example, if the user enters n = 3, the output should be:

***
***
***



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
 
 mov bx,1
 mov dl,'*' 
 loop3: 
 cmp bx, n
 jg seg
 int 21h 
 inc bx
 jmp loop3
 
 seg:
 mov ah,2
 mov dl,0dh
 int 21h
 mov dl,0ah
 int 21h
 
 loop start
 ;exit the program
 exit:
 mov ah,4ch
 int 21h
 main endp
end main
