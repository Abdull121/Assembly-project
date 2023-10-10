.model small
.stack 100h
.data
    text db "A", "C", "E", "G", "I", "K", "M", "O", "Q", "$"
    colors db 1, 2, 3, 4, 5, 6, 7, 8, 9, 0

.code


start:
    mov ax, @data
    mov ds, ax

    mov si, 0   ; Index for text and colors arrays
    mov cx, 10  ; Number of characters to display

display_loop:
    mov ah, 2   ; Function to display character
    mov dl, [text + si]  ; Load character from text array
    int 21h

    mov ah, 8   ; Function to set text color
    mov al, [colors + si]  ; Load color from colors array
    int 10h

    inc si     ; Move to the next character and color
    loop display_loop

    ; Exit program
    mov ah, 4Ch
    int 21h

end start
