.radix 16
.model small
.stack
.data
    numero db 08 dup('$')
    entre db "Entre $"
.code
.startup
    mov dx,0
    mov ax,69
    mov bx,57

    div bx
    
    mov di,offset numero
    cmp ax,0a
    jb cifra1

    cmp ax,64
    jb cifra2

    cmp ax,3e8
    jb cifra3

    cmp ax,2710
    jb cifra4

    cmp ax,0ffff
    jb cifra5

    cifra1:
        add ax,30
        mov si,offset numero
        mov [si],al
        jmp salir
    cifra2:
        mov bl,0a
        div bl

        add al,30
        add ah,30

        mov [di],al
        mov [di+1],ah
        jmp salir

    cifra3:
        mov bl,64
        div bl
        add al,30
        ;mov di,offset numero
        mov [di],al
        inc di

        ;Segundo digito
        xor bx,bx
        mov al,ah
        mov ah,0

        mov bl,0a
        div bl

        add al,30
        add ah,30

        mov [di],al
        mov [di+1],ah
        jmp salir
    
    
    cifra4:
        mov bx,3e8
        div bx
        
        add al,30
        
        mov [di],al
        inc di
        
        xor ax,ax
        mov ax,dx
        xor dx,dx
        
        cmp ax,64
        jae cifra3
        mov al,'0'
        mov [di],al
        inc di
        
        jmp cifra2
        
    cifra5:
        mov bx,2710
        div bx
        
        add al,30
        mov [di],al
        inc di
        
        xor ax,ax
        mov ax,dx
        xor dx,dx
        jmp cifra4
    salir:
        mov ah,09
        mov dx,offset numero
        int 21

.exit
end
