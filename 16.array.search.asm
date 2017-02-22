; М е едномерен масив от байтове, завършващ с байта 0. Напишете
; процедура, която добавя в края му символи от регистъра AL, ако този символ
; липсва в масива. Новият масив също да завършва с нулев байт.

.DATA   ; VARIABLES IN HEAP
        ARR     DB      1,2,3,4,5,6,7,8,9,10,0  ; NULL TERMINATED
.CODE
MAIN    PROC
        MOV     BX,0            ; BX = 0
SRCH:
        CMP     AL,ARR[BX]      ; AL == ARR[INDEX]
        JE      BREAK           ; IF TRUE RETURN
        INC     BX              ; BX = BX + 1 OR BX++
        CMP     ARR[BX-1],0     ; BX-1 == 0     (MINUS 1 BECAUSE ALLREADY INCREMENTED)
        JNE     SRCH            ; IF NOT TRUE GO TO SRCH
        MOV     ARR[BX],AL      ; IF INT NOT FOUND LAST INDEX == AL
        MOV     ARR[BX+1],0     ; MAKE NEW NULL POINTER AFTER LAST INDEX
BREAK:
    RET