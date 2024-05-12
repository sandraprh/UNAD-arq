.model small ; MODELO DEL PROGRAMA
.stack 100h ; VELOCIDAD Y RECURSOS

.data ;SEGMENTO PARA DECLARAR VARIABLES
    message1 db "Nombre: Sandra Pacheco Rhenals $" ; VARIABLE DEL MENSAJE1
    message2 db 10,13,"Id:1140887964 $" ; VARIABLE DEL MENSAJE

.code ;SEGMENTO PARA ESCRIBIR EL CODIGO
main PROC
    mov ax, @data ;ACUMULAR LA DIRECCION DE DATA
    mov ds,ax ; MOVER LA DIRECCION A DS

    mov ah, 09h ;FUNCION PARA MOSTRAR UNA CADENA
    lea dx, message1 ; CARGA LA DIRECCION DE "message1" EN DX
    int 21h ; INTERRUPCION 21H

    mov ah, 09h ;FUNCION PARA MOSTRAR UNA CADENA
    lea dx, message2 ; CARGA LA DIRECCION DE "message2" EN DX
    int 21h ; INTERRUPCION 21H

    mov ax, 4C00h ; FUNCION "DOS" PARA TERMINAR EL PROGRAMA
    int 21h
main ENDP

end main ; FINAL DEL PROGRAMA