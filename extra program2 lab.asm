program to end lcm and gco
code segment 
    assume cs:code
    start: 
    mov sI,000
    mov ax,[si]
    mov bx,[si+2]
    push ax
    push bx
    up
    cmp ax ,bx
    je exit
    jb down
    sub ax,bx
    jmp next
    jmp next
    down:sub bx,ax
    next:
    jmp up
    exit:
    mov cx,ax
    pop bx
    pop ax
    mul bx
    div cx
    int 3
    code ends
end start
end