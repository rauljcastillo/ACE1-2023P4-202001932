modocalc macro
    ;local initmodc, num, op,cif1,cif2,pedir,operar,sum,rest,multi,divisi
    initmodc:
        print op1

        num:
            mov ah,01
            int 21

            cmp al,0dh
            je op
            
            mov numero[si],al
            inc si
            
            mov auxiliar[di],al
            inc di

            jmp num

        op:
            call verif
            cmp numero[si+1],'$'
            jne cif2


            cif1:
                ;xor si,si
                xor bx,bx
                mov bl,numero[si]
                sub bl,30

                call negar

                push bx

                call limpiar

                mov al,06
                add ax,sp

                cmp ax,pila
                je operar
                ;print entre
                jmp pedir
            cif2:
                ;xor si,si
                xor bx,bx
                mov al,numero[si]
                sub al,30

                mov bl,0a ;multiplica por 10
                mul bl

                mov bl,numero[si+1]
                sub bl,30

                add bx,ax
                call negar
                push bx

                call limpiar

                mov al,06
                add ax,sp

                cmp ax,pila
                je operar

                jmp pedir
        
        pedir:
            print op2

            mov ah,01
            int 21

            cmp al,'='
            je salirmodc

            mov ah,0
            push ax

            mov auxiliar[di],al
            inc di

            jmp initmodc
        
        operar:
            pop cx
            pop bx
            pop ax
            
            cmp bl,'+'
            je sum

            cmp bl,'-'
            je rest

            cmp bl,'*'
            je multi

            cmp bl,'/'
            je divisi

            sum:
                add ax,cx
                push ax
                jmp pedir
            rest:
                sub ax,cx
                push ax
                jmp pedir
            multi:
                imul cx
                push ax
                jmp pedir
            divisi:
                xor dx,dx
                cwd
                idiv cx
                push ax
                jmp pedir
            

        limpiar:
            cmp numero[si],'$'
            je fin

            mov numero[si],'$'
            inc si
            jmp limpiar
        verif:
            xor si,si
            cmp numero[si],'-'
            je incrm
            ret

            incrm:
                inc si
                ret

        negar:
            mov si,0
            cmp numero[si],'-'
            je invertir
            ret 

            invertir:
                neg bx
                ret

        fin:
            xor ax,ax
            xor si,si
            ret 

        salirmodc:
            pop ax
            toascii
            temp:
                almac
                
    salir:
        jmp inicio

endm