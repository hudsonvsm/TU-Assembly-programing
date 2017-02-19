; ZA = (11XA/6) - 5YA 
; XA - 16 битово, YA – - битово със знам, ZA - 2 байтово

.DATA   ; VARIABLES IN HEAP
        ZA      DW ?
        XA      DW 7
        YA      DB 3

        .CODE
MAIN    PROC
        MOV     AX,11   ;   AX = 11
        MOV     BX,XA   ;   BX = XA
        IMUL    BX      ;   AX = 11 * XA
        MOV     BX,6    ;   BX = 6
        IDIV    BX      ;   AX = (11 * XA)/6
        MOV     CX,AX   ;   CX = (11 * XA)/6
        MOV     AL,YA   ;   AX = YA
        MOV     BX,5    ;   BX = 5
        IMUL    BX      ;   AX = YA * 5
        SBB     CX,AX   ;   CX = ((11*XA)/6) – (5*YA)
        MOV     ZA,CX   ;   ZA = CX
    RET