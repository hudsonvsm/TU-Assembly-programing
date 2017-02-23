; Въвеждане и извеждане на низ.

.DATA   ; VARIABLES IN HEAP
        STR1    DB 10 DUP(0)    ; DUPLICATE 10 TIMES NULL (0,0,0,0,0,0,0,0,0,0)
        COUNT1  =   ($ - STR1)  ; ($ IS END OF S1) (S1 IS THE BEGINIG)
.CODE
MAIN    PROC
        MOV     CX,COUNT1       ; CX = 10
        MOV     DI,OFFSET STR1  ; MOVE STRING OFFSET TO DI (INPUT)
        MOV     AH,08           ; PREPARE TO START INPUT OF CHARS
INPUT:
        INT     21H             ; EXECUTES STORED OPERATION IN 'AL' (WAITS FOR INPUT)
        STOSB                   ; OPERATION THAT STORES THE CURRENT INPUT CHAR IN 
                                ; CORRESPONDING INDEX OF STR1 
                                ; TAKES FROM `AL` AND PUTS IT IN `DI`
        LOOP    INPUT           ; LOOPS WHILE CX != 0 (ALSO DECREMENTS `CX`)

        MOV     CX,COUNT1       ; CX = 10
        MOV     SI,OFFSET STR1  ; MOVE STRING OFFSET TO SI (OUTPUT)
        MOV     AH,02           ; PREPARE TO START PRINTING OF CHAR
OUTPUT:
        LODSB                   ; OPERATION THAT TAKES THE CURRENT CHAR FROM STR1 (SI)
                                ; ON CORRESPONDING INDEX AND STORES IT IN 'AL'
        MOV     DL,AL           ; DL = AL
        INT     21H            ;EXECUTES STORED OPERATION IN 'AH' (OUTPUT CHAR IN 'DL')
        LOOP    OUTPUT
    RET