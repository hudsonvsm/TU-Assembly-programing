; Извежда на екрана десетични числа записани в масива 01 | 09 | 07 | 03 | 06 | + m

.DATA
    ARR     DB  1,9,7,3,1,2,4,6,5,7,8
    COUNT   =   ($ - ARR)   ;   ($ IS END OF ARR) (ARR IS THE BEGINIG)

.CODE
MAIN    PROC
        MOV     BX,0        ;   BX = 0      (INDEX)
        MOV     AH,2        ;   AH = 2      (PREPARE FOR PRINT)
PRINT:
        MOV     DL,'0'      ;   DL = '0'    (CHAR TO PRINT)
        INT     21H         ;   PRINT
        MOV     DL,ARR[BX]  ;   DL = ARR[BX]
        ADD     DL,'0'      ;   ADD ZERO CHAR TO MAKE THE INT CHAR  ('0' == 48) ASCII
;        ADD     DL,48      ;   ADD INT 48 TO MAKE THE INT CHAR     (48 == '0') ASCII
        INT     21H         ;   PRINT
        MOV     DL,'|'      ;   DL = '|' (PIPE CHAR)
        INT     21H         ;   PRINT
        INC     BX          ;   BX = BX + 1 OR BX++
        CMP     BX,COUNT    ;   BX == COUNT
        JB      PRINT       ;   IF NOT FINAL INT CONTINUE PRINT
    RET