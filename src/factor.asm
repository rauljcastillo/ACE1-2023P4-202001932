fact macro
    local bucle,salir

    print modc
    mov ah,01
    int 21
    sub al,30
    mov ah,0
    mov bx,ax

    mov ax,01 ;Contador
    mov si,02 ;Empieza a multiplicar por 2

    cmp bx,04
    ja errorfac
    bucle:
        cmp si,bx
        ja salir

        mul si
        inc si
        jmp bucle
    errorfac:
        print errfact
    salir:
        toascii
        mov ah,02
        mov dl,0a
        int 21
        print factori
        print numero
        call limpiarNum
        jmp inicio

    limpiarNum:
        xor di,di
        clean1:
            cmp numero[di],'$'
            je finclean1

            mov numero[di],'$'
            inc di
            jmp clean1
        finclean1:
            xor di,di
            ret
endm