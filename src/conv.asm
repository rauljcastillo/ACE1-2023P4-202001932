toascii macro
    local convertir,cifra1,cifra2,cifra3,cifra4,cifra5,salir1,complemento,sa
    cmp ax,0
    jl complemento

    mov di,offset numero
    convertir:  
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
            mov [di],al
            jmp salir1
        cifra2:
            mov bl,0a
            div bl

            add al,30
            add ah,30

            mov [di],al
            mov [di+1],ah
            jmp salir1

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
            jmp salir1
                
                
        cifra4:
            xor dx,dx
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
            mov bl,'0'
            mov [di],bl
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
        salir1:
            jmp sa

    complemento:
        neg ax
        mov di,offset numero
        mov bl,'-'
        mov [di],bl
        mov bl,0
        inc di

        
        jmp convertir
    sa:
 
endm

print macro cadena
    mov ah,09
    mov dx,offset cadena
    int 21
endm
