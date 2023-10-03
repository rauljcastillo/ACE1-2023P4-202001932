;---------------------------------Importar macros----------------------------
include modoc.asm
include saves.asm
include modoa.asm
include factor.asm
include conv.asm
include aritmet.asm
include repor.asm

;----------------------------------Inicia programa--------------------------
.radix 16
.model small
.stack
.data
    aritmetic db 14 dup('$')
    texto db "Universidad de San Carlos de Guatemala",0a,"Facultad de Ingenieria",0a,"Arquitectura de Computadores y Ensambladores 1",
    0a,'Seccion "A"',0a, "Segundo Semestre 2023",0a,0a,"Nombre: Raul Josue Castillo Barco",0a,"Carne: 202001932",0a,"$"
    filename db 'reporte.html',0
    nameop db 14 dup('$') ;Guarda el nombre de la operacion
    auxiliar db 14 dup('$') ;Arreglo auxiliar para guardar la etiqueta de las operaciones
    cadena db 'prueba.arq',0
    menu db 0ah,"1.Modo calculadora ",0ah,"2.Modo archivo",0a,"3.Factorial",0a,"4.Reporte",0a,"$"
    msg db 0a,"Ingrese una opcion :$"
    modc db 0a,"Ingrese un numero: ","$"
    errfact db "Debe ingresar un numero menor o igual que 4 ",0a,"$"
    path db 'prueba.txt',0
    op1 db 0a,"Ingrese numero: $"
    op2 db 0a,"Ingrese operador: $"
    quest db 0a,"Desea guardar la operacion? S/N $"
    factori db "El resultado es: $"
    error db "Error $"
    numero db 08 dup('$')
    pila dw ?
    handler dw ?
    char db ?
    entre db "Entre $"
    fil dw 0
    id db 0


    html db '<!DOCTYPE html>',0a,'<head>',0a,'<meta charset="UTF-8">',0a,'<title>Reporte</title>',0a,'</head>',0a,
            '<body>',0a,'<h2>Practica 4 Arqui 1 Seccion B</h2>',0a,'<p><b>Estudiante: </b> Raúl Josue Castillo Barco</p>',0a,
            '<p><b>Carnet: </b> 202001932</p>',0a,'<p><b>Fecha:</b> 20/10/20203</p>',0a,'<p><b>Hora:</b> 15:15</p>',0a
    encab db '<tr>',0a,'<th>ID</th>',0a,'<th>Operacion</th>',0a,'<th>Resultado</th>',0a,'</tr>',0a
    optable db '<table border="1">',0a
    optr db "<tr>",0a       ;abrir etiqueta fila tr
    ctr db "</tr>",0a          ; cerrar etiqueta fila tr
    optd db "<td>"          ; abrir td
    ctd db "</td>",0a       ;cerrar td
    ctab db "</table>",0a 
    finhtml db "</body>",0a,"</html>",0a

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

    valores db 07 dup('$')
            db 07 dup('$')
            db 07 dup('$')
            db 07 dup('$')
            db 07 dup('$')
            db 07 dup('$')
            db 07 dup('$')
            db 07 dup('$')
            db 07 dup('$')
            db 07 dup('$')
    

.code
.startup
    mov pila,sp
    print texto
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

            cmp al,'4'
            je modo4

            jmp modos

        modo4:
            mov ah,3ch
            mov cx,00
            mov dx,offset filename
            int 21h
            mov bx,ax
            reporte

        modo3:
            fact    

        modo2:
            mov ah,3d
            mov al,0
            mov dx,offset cadena
            int 21
            ;jc Errors
            mov handler,ax
            file
        modo1:
            modocalc
            
.exit
end