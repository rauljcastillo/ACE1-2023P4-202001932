aritmeticas macro
    local ifor,OperationInit,suma,resta,negar,mult,divis,fin,aa
    xor si,si
    xor bx,bx
    ifor:
        cmp aritmetic[si+1],'$'
        je OperationInit

        inc si
        jmp ifor
            
    OperationInit:

        cmp si,0ffff 
        je fin

        mov dl,aritmetic[si]

        cmp dl,'+'
        je suma

        cmp dl,'-'
        je resta

        cmp dl,'*'
        je mult

        cmp dl,'/'
        je divis

        mov dh,0
        sub dl,30 ;Si no es ninguno entonces es un numero
        push dx
        dec si
        jmp OperationInit

    suma:
        pop ax
        pop cx
        add ax,cx
        push ax

        dec si   
        xor cx,cx  ;Limpio reg
        xor ax,ax  ; Limpio reg
        jmp OperationInit

    resta:
        pop ax

        cmp pila,sp
        je negar

        pop cx

        ;cmp cx,0
        ;je negar

        sub ax,cx
        push ax

        dec si
        xor cx,cx
        xor ax,ax   
        jmp OperationInit

    negar:
        neg ax
        push ax
        
        dec si
        xor ax,ax
        jmp OperationInit

    mult:
        pop ax
        pop cx
        imul cx
        push ax

        dec si   
        xor ax,ax  ;Limpio reg
        ;xor cx,cx  ; Limpio reg
        jmp OperationInit
    divis:
        xor dx,dx
        pop ax
        pop cx
        idiv cx

        ;mov ah,0 ;Solo deseo el cociente asi que coloco 0 en ah
        push ax

        dec si   
        xor ax,ax  ;Limpio reg
        xor cx,cx  ; Limpio reg
        jmp OperationInit
    fin:
        pop ax
        toascii
        ;Salto de linea
        mov ah,02
        mov dl,0ah
        int 21
        
        print nameop
        print numero

        ;Salto de linea
        mov ah,02
        mov dl,0ah
        int 21
    aa:
endm
