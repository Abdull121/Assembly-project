.model small
.stack 100h
.data  
array db 1,2,3,4,5

.code
main proc 
    mov ax, @data
    mov ds, ax   
    mov ah,1
    int 21h
    mov si, offset array
    mov dx, [si]
    mov dl, si[2]
    add dl, 48
    mov ah, 2
    int 21h
    
    
    main endp
end main