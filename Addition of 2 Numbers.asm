.MODEL small
.STACK 100h
.DATA
    msg1 db "ENTER FIRST NUMBER: $"
    msg2 db "ENTER SECOND NUMBER: $"
    msg3 db "ADDITION OF THE NUMBERS ARE: $"
    newline db 0Dh, 0Ah, "$"  ; Carriage return + Line feed

NUM1 DB ?
NUM2 DB ?
SUM DB ?

.CODE
   MAIN PROC
    ; Initialize data segment
    mov ax, @DATA
    mov ds, ax
    
    ; Print message 1: "ENTER FIRST NUMBER: "
    mov ah, 09h
    lea dx, msg1
    int 21h
    
    ; Read first number
    mov ah, 01h
    int 21h
    sub al, '0'   ; Convert ASCII to integer
    mov NUM1, al

    ; Print newline
    mov ah, 09h
    lea dx, newline
    int 21h
    
    ; Print message 2: "ENTER SECOND NUMBER: "
    mov ah, 09h
    lea dx, msg2
    int 21h
    
    ; Read second number
    mov ah, 01h
    int 21h
    sub al, '0'   ; Convert ASCII to integer
    mov NUM2, al     ;loads the value from AL to NUM2..then AL is free

    ; Print newline
    mov ah, 09h
    lea dx, newline
    int 21h
    
    ; Perform addition
    mov al, NUM1
    add al, NUM2
    add al, '0'   ; Convert back to ASCII
    mov SUM, al

    ; Print message 3: "ADDITION OF THE NUMBERS ARE: "
    mov ah, 09h
    lea dx, msg3
    int 21h

    ; Print sum
    mov ah, 02h
    mov dl, SUM
    int 21h

    ; Print newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

   MAIN ENDP
   END MAIN
