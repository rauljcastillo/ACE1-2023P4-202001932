newCaracter MACRO carac
    mov ah,3f
    mov bx,handler
    mov cx,01
    mov dx,offset carac
    int 21
ENDM

file macro
    leer:
        xor si,si
        newCaracter char

        cmp char,':'
        je aritm

        mov al,char
        mov nameop[di],al
        inc di
        jmp leer
    
        ;Llenar el arreglo para operaciones
        aritm:
            mov nameop[di],':'

            newCaracter char
            cmp ax,0
            jz ultima

            cmp char,','
            je llamada

            
            cmp char,20     ; Si hay espacios que salte al otro caracter
            je aritm

            mov al,char
            mov aritmetic[si],al
            inc si
            jmp aritm

        llamada:
            aritmeticas
            saltito:
                call limpiarArr
                call limpiarname
                call limpiarArit
                jmp leer
        
        limpiarArr:
            xor di,di
            clean:
                cmp numero[di],'$'
                je finclean

                mov numero[di],'$'
                inc di
                jmp clean
            finclean:
                xor di,di
                ret
        limpiarname:
            xor di,di
            limpiaName:
                cmp nameop[di],'$'
                je finlimpia

                mov nameop[di],'$'
                inc di
                jmp limpiaName
            finlimpia:
                xor di,di
                ret
        limpiarArit:
            xor di,di
            cleanar:
                cmp aritmetic[di],'$'
                je fincleanar

                mov aritmetic[di],'$'
                inc di
                jmp cleanar
            fincleanar:
                xor di,di
                ret
        ultima:
            aritmeticas
            salto:
                call limpiarArr
                jmp cerrar         
                

    Errors:
        print error
        jmp salirmoda
    cerrar:
        mov ah,3e
        mov bx,handler
        int 21
    salirmoda:
        jmp inicio
endm