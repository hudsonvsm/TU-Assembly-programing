; Да се напише процедура, която по зададени два стрингови низа S1 и S2,
; завърщващи с 0, се записва в стрингов низ S12, като първо се запише S1,
; а след него S2 (Конкатенация на S1 и S2 = S12).

;   [S12+BX] == S12[BX] IS THE SAME THING USED BOTH VARIATIONS FOR LEARNING PURPOSES

.DATA   ; VARIABLES IN HEAP
        S1      DB      'EXAMPLE'
        COUNT1  =   ($ - S1)
        S2      DB      ' STRING'
        COUNT2  =   ($ - S2)
        S12     DB      '              ',0 ; THIS STRING IS NULL TREMINATED (,0)
.CODE
MAIN    PROC
        MOV     BX,0                ; BX = 0
        MOV     AX,COUNT1           ; AX = COUNT1
STR1:
        MOV     DL,S1[BX]           ; DL = S1[INDEX]
        MOV     [S12+BX],DL         ; S12[INDEX] = DL
        INC     BX                  ; BX = BX + 1 OR BX++
        CMP     BX,AX               ; BX == COUNT1(AX)
        JNE     STR1                ; IF NOT TRUE GO TO STR1
        MOV     BX,0                ; BX = 0 (PREPARE FOR NEXT STRING)
        MOV     AX,COUNT2           ; AX = COUNT2
STR2:
        MOV     DL,S2[BX]           ; DL = S2[INDEX]
        MOV     {S12+BX+COUNT1],DL  ; S12[INDEX] = DL
        INC     BX                  ; BX = BX + 1 OR BX++
        CMP     BX,AX               ; BX == COUNT1
        JNE     STR2                ; IF NOT TRUE GO TO STR2
    RET