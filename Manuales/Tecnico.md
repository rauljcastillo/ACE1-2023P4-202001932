Manual Técnico
===================
#### Universidad de San Carlos de Guatemala
#### Facultad de Ingeniería
#### Arquitectura de computadoras y Ensambladores 1
#### Sección A
#### Segundo Semestre 2023

## Microsoft Macro Assembler

La práctica fue realizada en el lenguaje Microsoft macro assembler en su version 6.11 y usando el emulador Dosbox el cual simula el entorno del sistema MS-DOS.

## 1 Estructura

La practica se realizo en su mayor parte usando interrupciones. Estas detienen la ejecución del programa hasta que se termine la interaccion con el sistema operativo. 

La unica interrupcion que se utilizo fue la interrupción 21 usando la siguiente sintáxis.

La interrucion 21 con el parametro 09 fue la más utilizada pues esta imprime en consola el conjunto de caracteres que se desee.

## 2 Saltos
Para controlar el flujo dl programa se utilizaron saltos y saltos condicionales

## 3 Lectura del archivo
La lectura del archivo se realizó por medio de la interrupcion 21h y 3dh, con esta se genera un manejador del archivo que puede ser utilizado posteriormente como la lectura del archivo y finalmente cerrarla.

