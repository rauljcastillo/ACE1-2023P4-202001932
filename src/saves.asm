almac MACRO
    print quest
    mov ah,01
    int 21

    cmp al,'s'
    je saveid
    jmp exit   
    
    saveid:
        mov ax,fil
        mov bl,02

        mul bl
        mov di,ax     ; Esta operacion solo me da el numero de fila

        add al,id
        add al,30
        mov ids[di],al

    savet:
        mov ax,fil
        mov bl,14
        mul bl
        mov di,ax

        xor ax,ax
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
        mov bl,06
        mul bl
        mov di,ax

        bucle1:
            mov al,numero[si]
            mov valores[di],al
            inc si
            inc di

            cmp numero[si],'$'
            je finb1
            jmp bucle1
            finb1:
                xor ax,ax
                xor bx,bx
                xor di,di
                xor si,si

    exit:
ENDM