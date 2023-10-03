almac MACRO
    print quest
    mov ah,01
    int 21

    cmp al,'s'
    je saveid
    jmp bnum   
    
    saveid:
        mov ax,fil
        mov bl,02

        mul bl
        mov di,ax     ; Esta operacion solo me da el numero de fila

        mov al,id
        add al,30
        mov ids[di],al

    savet:
        mov ax,fil
        mov bl,14
        mul bl
        mov di,ax

        xor ax,ax
        xor si,si
        bucle:
            mov al,auxiliar[si]
            mov labels[di],al

            inc di
            inc si

            cmp auxiliar[si],'$'
            je salirb
            jmp bucle

            salirb:
                xor ax,ax
                xor di,di
                xor si,si
                xor bx,bx

    saver:
        mov ax,fil
        mov bl,07
        mul bl
        mov di,ax

        ;Salto de linea
        mov ah,02
        mov dl,0ah
        int 21

        print factori
        mov ah,09
        mov dx,offset numero
        int 21

        ;Salto de linea
        mov ah,02
        mov dl,0ah
        int 21

        bucle1:
            mov al,numero[si]
            mov valores[di],al

            

            inc si
            inc di

            cmp numero[si],'$'
            je finb1
            jmp bucle1
            finb1:
                inc fil
                inc id
                xor ax,ax
                xor bx,bx
                xor di,di
                xor si,si

    ;Borrar arreglo numero
    bnum:
        cmp numero[si],'$'
        je sbnum

        mov numero[si],'$'
        inc si
        jmp bnum

        sbnum:
            xor si,si
    ;Borrar auxiliar
    baux:
        cmp auxiliar[si],'$'
        je sbaux

        mov auxiliar[si],'$'
        inc si
        jmp baux

        sbaux:
            xor si,si
            jmp inicio
ENDM