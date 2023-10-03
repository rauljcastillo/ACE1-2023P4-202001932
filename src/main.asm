;---------------------------------Importar macros----------------------------
include modoc.asm
include saves.asm
include modoa.asm
include factor.asm
include conv.asm
include aritmet.asm

;----------------------------------Inicia programa--------------------------
.radix 16
.model small
.stack
.data
    aritmetic db 14 dup('$')
    nameop db 14 dup('$') ;Guarda el nombre de la operacion
    auxiliar db 14 dup('$') ;Arreglo auxiliar para guardar la etiqueta de las operaciones
    cadena db 'prueba.txt',0
    menu db 0ah,"1.Modo calculadora ",0ah,"2.Modo archivo",0a,"3.Factorial",0a,"$"
    msg db 0a,"Ingrese una opcion :$"
    modc db 0a,"Ingrese un numero: ","$"
    errfact db "Debe ingresar un numero menor o igual que 4 ",0a,"$"
    path db 'prueba.txt',0
    op1 db 0a,"Ingrese numero: $"
    op2 db 0a,"Ingrese operador: $"
    quest db 0a,"Desea guardar la operacion? S/N $"
    factori db "El factorial es: $"
    error db "Error $"
    numero db 08 dup('$')
    pila dw ?
    handler dw ?
    char db ?
    entre db "Entre $"
    fil dw 0
    id db 0
    ;Almacena la etiqueta del numero
    ids db 02 dup('$')
        db 02 dup('$')
        db 02 dup('$')
        db 02 dup('$')
        db 02 dup('$')
        db 02 dup('$')
        db 02 dup('$')
        db 02 dup('$')
        db 02 dup('$')
        db 02 dup('$')

    labels db 14 dup('$')
           db 14 dup('$')
           db 14 dup('$')
           db 14 dup('$')
           db 14 dup('$')
           db 14 dup('$')
           db 14 dup('$')
           db 14 dup('$')
           db 14 dup('$')
           db 14 dup('$')

    valores db 06 dup('$')
            db 06 dup('$')
            db 06 dup('$')
            db 06 dup('$')
            db 06 dup('$')
            db 06 dup('$')
            db 06 dup('$')
            db 06 dup('$')
            db 06 dup('$')
            db 06 dup('$')

.code
.startup
    mov pila,sp
    inicio:
        print menu
        modos:
            xor si,si
            xor di,di
            print msg
            mov ah,01
            int 21

            cmp al,'1'
            je modo1

            cmp al,'2'
            je modo2

            cmp al,'3'
            je modo3

            jmp modos

        modo3:
            fact    

        modo2:
            mov ah,3d
            mov al,0
            mov dx,offset cadena
            int 21
            jc Errors
            mov handler,ax
            file
        modo1:
            modocalc
            
.exit
end