; Сравняване на 2 стринга, записани в сегмента за данни. ... програмата
; попълва втория стринг със символа ‘n’ от позициите на първата разлика
; до края му.

;   [S1+BX] AND S1[BX] ARE SAME THING USED BOTH VARIATIONS FOR LEARNING PURPOSES

.DATA   ; VARIABLES IN HEAP
        S1      DB     'EXAM PLE',0 ; NULL TERMINATED STRING
        COUNT1  =   ($ - S1)
        S2      DB     'EXAMPLEs',0 ; NULL TERMINATED STRING
        COUNT2  =   ($ - S2)
.CODE
MAIN    PROC
        MOV     BX,0                ; BX = 0
CHECK:
        CMP     [S1+BX],0           ; IS S1[INDEX] == NULL
        JE      FILL                ; IF TRUE GO TO FILL    (BREAK LOOP)
        CMP     S2[BX],0            ; IS S2[INDEX] == NULL
        JE      FINISH              ; IF TRUE GO TO FINISH  (BREAK LOOP)
        MOV     DL,S1[BX]           ; DL = S1[INDEX]
        CMP     [S2+BX],DL          ; IS S2[INDEX] == DL
        JNE     FILL                ; IF TRUE GO TO FILL    (BREAK LOOP)
        INC     BX                  ; BX = BX + 1 OR BX++   (INCREMENT)
        JMP     CHECK               ; UNCONDITIONAL         (CONTINUE LOOP)
FILL:
        CMP     [S2+BX],0           ; IS S2[INDEX] == NULL
        JE      FINISH              ; IF TRUE GO TO FINISH  (BREAK LOOP)
        MOV     [S2+BX],'n'         ; S2[INDEX] = 'n'
        INC     BX                  ; BX = BX + 1 OR BX++   (INCREMENT)
        JMP     FILL                ; UNCONDITIONAL         (CONTINUE LOOP)
FINISH:
    RET