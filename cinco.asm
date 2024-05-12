.model small ; MODELO DEL PROGRAMA
.stack 100h ; VELOCIDAD Y RECURSOS

.data ;SEGMENTO PARA DECLARAR VARIABLES

    m1 db "Escribe el primer numero: $" ; MENSAJE PRIMER NUMERO
    m2 db 10,13,"Escribe el segundo numero: $" ; MENSAJE SEGUNDO NUMERO
    m3 db 10,13,"Resultado de la division: $" ; MENSAJE RESULTADO
    m4 db 10,13,"Residuo: $" ; MENSAJE RESULTADO

    numeroUno db 0 ; VARIABLE DONDE SE DEPOSITARA EL PRIMER NUMERO
    numeroDos db 0 ; VARIABLE DONDE SE DEPOSITARA SEGUNDO NUMERO
    resultadoDivision db 0 ; VARIABLE DONDE SE DEPOSITARA EL TOTAL DE LA DIVISION
    residuo db 0;

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

    ;SEGMENTO DIVISION
    mov al,numeroUno ; MUEVE EL VALOR CAPTADO EN LA VARIABLE "numeroUno" a "AL"
    xor ah,ah ; BORRAR EL REGISTRO AH
    div numeroDos ; SE DIVIDE EL VALOR DE LA VARIABLE "numeroDos"
    mov resultadoDivision, al ; EL RESULTADO DE "AL" LO GUARDA EN LA VARIABLE "resultadoDivision"

    ;RESIDUO
    mov al,numeroUno ; MUEVE EL VALOR CAPTADO EN LA VARIABLE "numeroUno" a "AL"
    div numeroDos ; SE DIVIDE EL VALOR DE LA VARIABLE "numeroDos"
    mov residuo, ah ; EL RESULTADO DE "Ah" LO GUARDA EN LA VARIABLE "residuo"

    ;IMPRIMIR EL RESULTADO DE LA DIVISION
    mov ah, 09h ;FUNCION PARA MOSTRAR UNA CADENA
    lea dx, m3 ; CARGA LA DIRECCION DE "m3" EN DX
    int 21h ; INTERRUPCION 21H
    mov dl,resultadoDivision
    add dl, 30h ; SUMA 30H(hexadecimal)/48D CODIGO ASCII
    mov ah,2 ;SERVICIO QUE MUESTRA EL RESULTADO
    int 21h ; INTERRUPCION 21H

    ;IMPRIMIR EL RESIDUO DE LA DIVISION
    mov ah, 09h ;FUNCION PARA MOSTRAR UNA CADENA
    lea dx, m4 ; CARGA LA DIRECCION DE "m4" EN DX
    int 21h ; INTERRUPCION 21H
    mov dl,residuo
    add dl, 30h ; SUMA 30H(hexadecimal)/48D CODIGO ASCII
    mov ah,2 ;SERVICIO QUE MUESTRA EL RESULTADO
    int 21h ; INTERRUPCION 21H

    mov ax, 4C00h ; FUNCION "DOS" PARA TERMINAR EL PROGRAMA
    int 21h
main ENDP

end main ; FINAL DEL PROGRAMA