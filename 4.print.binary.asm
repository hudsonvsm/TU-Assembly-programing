; В акумулатора AL на микропроцесора е записано едно 16-тично число.
; Програмата трябва да изведе това число в двуичен вид.

.DATA
    TEMP    DW ?,0      ; NULL TERMINATED
.CODE
MAIN    PROC
PRINT:
        JE      DONE
        SHR     AL,1    ;   AL = AL/2   CHANGES CF
        MOV     DL, '1' ;   ELSE PREPARE TO PRINT 1
        JNC             ;   IF CF == 0
        MOV     DL, '0' ;   PREPARE TO PRINT 0
        MOV     AH, 2   ;   BEGIN PRINTING
        INT     21H     ;   PRINT
        JMP     PRINT   ;   RETURN TO MAIN FUNCTION
DONE:
        INT     21H
    RET