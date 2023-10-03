reporte MACRO

    mov ah,40
    mov cx,10c
    mov dx,offset html
    int 21h
    
    mov ah,40
    mov cx,13
    mov dx,offset optable
    int 21h

    mov ah,40
    mov cx,3c
    mov dx,offset encab
    int 21
    
    mov fil,0
    cfor:
        mov ax,fil
        mov cl,02
        mul cl
        mov di,offset ids
        add di,ax
        mov ah,'$'
        cmp [di],ah
        je scfor

        xor cx,cx
        ;Escribe <tr>
        mov ah,40h
        mov cx,05
        mov dx,offset optr
        int 21h             

        ;Escribo <td>
        mov ah,40h
        mov cx,04
        mov dx,offset optd
        int 21h 

        ;Obtengo la fila de la matriz ids
        mov ax,fil
        mov cl,02
        mul cl

        ;Obtengo la direccion y sumo el desplazamiento y escribo
        mov dx,offset ids
        add dx,ax
        mov ah,40h
        mov cx,01
        int 21h 

        ;Escribo </td>
        mov ah,40h
        mov cx,06
        mov dx,offset ctd
        int 21h 
        
        ;Escribo <td>
        mov ah,40h
        mov cx,04
        mov dx,offset optd
        int 21h 
        
        ;Obtengo la fila de la matriz labels
        xor cx,cx
        mov ax,fil
        mov cl,14
        mul cl
        mov cx,ax

        ;Escribo el contenido del label
        mov di,offset labels
        call NumBytes
        
        mov ah,40
        mov dx,offset labels
        add dx,cx
        mov cx,si
        int 21

        ;Escribo </td>
        mov ah,40
        mov cx,06
        mov dx,offset ctd
        int 21h 

        ;Escribo <td>
        mov ah,40h
        mov cx,04
        mov dx,offset optd
        int 21h 

        ;Obtengo la fila de la matriz valor
        xor cx,cx

        mov ax,fil
        mov cl,07
        mul cl
        mov cx,ax
        ;Escribo el contenido del valor
        mov di,offset valores
        call NumBytes
        
        mov ah,40
        mov dx,offset valores
        add dx,cx
        mov cx,si
        int 21

        ;Escribo </td>
        mov ah,40h
        mov cx,06
        mov dx,offset ctd
        int 21h

        ;Escribe </tr>
        mov ah,40h
        mov cx,06
        mov dx,offset ctr
        int 21h 

        inc fil
        jmp cfor 

    NumBytes:
        xor si,si
        mov ah,'$'
        nbucle:
            cmp [di],ah
            je salitnum

            inc si
            inc di
            jmp nbucle
        salitnum:
            xor di,di
            xor ax,ax
            ret
    scfor:
        mov ah,40
        mov cx,09
        mov dx,offset ctab
        int 21h 

        xor ax,ax
        xor cx,cx
        xor dx,dx
        mov ah,40
        mov cx,10
        mov dx,offset finhtml
        int 21

        xor di,di
        xor si,si
        
    rsalir:
        ;Cierra archivo
        mov ah,3e
        int 21
        jmp inicio
ENDM

