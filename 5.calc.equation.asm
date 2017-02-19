;XA = (AA*2 + BA*CA)/(DA - 3)
.DATA
        XA   DW ?
        AA   DW 2
        BA   DW 3
        CA   DW 4
        DA   DW 5
.CODE
MAIN    PROC
        MOV     AX,2    ;   AX = 2
        IMUL    AA      ;   AX = 2 * AA
        MOV     CX,AX   ;   CX = 2 * AA
        MOV     AX,BA   ;   AX = BA
        IMUL    CA      ;   AX = BA * CA
        ADD     AX,CX   ;   AX = (AA*2 + BA*CA)
        MOV     BX,DA   ;   BX = DA
        SBB     BX,3    ;   BX = DA - 3
        IDIV    BX      ;   AX = (AA*2 + BA*CA)/(DA - 3)
        MOV     XA,AX   ;   XA = (AA*2 + BA*CA)/(DA - 3)
        RET