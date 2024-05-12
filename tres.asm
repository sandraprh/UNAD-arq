.model small ; MODELO DEL PROGRAMA
.stack 100h ; VELOCIDAD Y RECURSOS

.data ;SEGMENTO PARA DECLARAR VARIABLES

    m1 db "Escribe el primer numero: $" ; MENSAJE PRIMER NUMERO
    m2 db 10,13,"Escribe el segundo numero: $" ; MENSAJE SEGUNDO NUMERO
    m3 db 10,13,"El resultado es: $" ; MENSAJE RESULTADO

    numeroUno db 0 ; VARIABLE DONDE SE DEPOSITARA EL PRIMER NUMERO
    numeroDos db 0 ; VARIABLE DONDE SE DEPOSITARA SEGUNDO NUMERO
    resultadoResta db 0 ; VARIABLE DONDE SE DEPOSITARA EL TOTAL DE LA RESTA

.code ;SEGMENTO PARA ESCRIBIR EL CODIGO
main PROC
    mov ax, @data ;ACUMULAR LA DIRECCION DE DATA
    mov ds,ax ; MOVER LA DIRECCION A DS

    mov ah, 09h ;FUNCION PARA MOSTRAR UNA CADENA
    lea dx, m1 ; CARGA LA DIRECCION DE "m1" EN DX
    int 21h ; INTERRUPCION 21H

    mov ah, 1 ; FUNCION PARA RECIBIR ENTRADA
    int 21h ; INTERRUPCION 21H
    sub al, 30h ; RESTAR 30H(hexadecimal)/48D CODIGO ASCII
    mov numeroUno, al ; MOVER NUMERO A LA VARIABLE "numeroUno"

    mov ah, 09h ;FUNCION PARA MOSTRAR UNA CADENA
    lea dx, m2 ; CARGA LA DIRECCION DE "m2" EN DX
    int 21h ; INTERRUPCION 21H

    mov ah, 1 ; FUNCION PARA RECIBIR ENTRADA
    int 21h ; INTERRUPCION 21H
    sub al, 30h ; RESTAR 30H(hexadecimal)/48D CODIGO ASCII
    mov numeroDos, al ; MOVER NUMERO A LA VARIABLE "numeroDos"

    ;SEGMENTO RESTA
    mov al,numeroUno ; MUEVE EL VALOR CAPTADO EN LA VARIABLE "numeroUno" a "AL"
    sub al,numeroDos ; LUEGO LE RESTA A "AL" EL VALOR DE LA VARIABLE "numeroDos"
    add al, 30h ; SUMA 30H(hexadecimal)/48D CODIGO ASCII
    mov resultadoResta, al ; EL RESULTADO DE "AL" LO GUARDA EN LA VARIABLE "resultadoResta"

    mov ah, 09h ;FUNCION PARA MOSTRAR UNA CADENA
    lea dx, m3 ; CARGA LA DIRECCION DE "m3" EN DX
    int 21h ; INTERRUPCION 21H

    mov ah,2 ;SERVICIO QUE MUESTRA EL RESULTADO
    mov dl,resultadoResta ; MUEVE RESULTADO A LA VARIABLE "resultadoResta"
    int 21h ; INTERRUPCION 21H

    mov ax, 4C00h ; FUNCION "DOS" PARA TERMINAR EL PROGRAMA
    int 21h
main ENDP

end main ; FINAL DEL PROGRAMA