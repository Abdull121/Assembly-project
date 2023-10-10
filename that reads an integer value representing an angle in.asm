.model small   
.stack 100h

.data
    degrees db ?
    radians db ?
    message db 'Angle in radians: $'


start:
    mov ax, @data
    mov ds, ax

    ; Display prompt
    mov ah, 9
    lea dx, prompt
    int 21h

    ; Input angle in degrees
    mov ah, 1
    int 21h
    sub al, 30h   ; Convert ASCII to binary
    mov degrees, al

    ; Convert degrees to radians
    mov ah, 0
    mov al, degrees
    mov bl, 180
    div bl        ; AL = AL / 180
    mov radians, al

    ; Set text mode and color (yellow background, red text)
    mov ah, 0x00  ; Set video mode
    mov al, 0x03  ; Mode 3: 80x25 text mode
    int 10h

    mov cx, 10
    mov dl, radians
blink_loop:
    ; Display angle in radians with red text on yellow background
    mov ah, 9     ; Display character and attribute
    mov al, dl
    mov bh, 0x0E  ; Yellow background, red text
    int 10h

    ; Delay for blinking effect
    mov ax, 0
    mov cx, 5000
delay_loop:
    loop delay_loop

    ; Clear the display
    mov al, ' '
    mov bh, 0x0E  ; Yellow background, red text
    int 10h

    loop blink_loop

    ; Display final message
    mov ah, 9
    lea dx, message
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

prompt db 'Enter angle in degrees: $'

end start
