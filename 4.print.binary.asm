;� ����������� AL �� �������������� � �������� ���� 16-����� �����.
;���������� ������ �� ������ ���� ����� � ������� ���.
.DATA
    TEMP    DW ?
.CODE
MAIN    PROC
PRINT:
        JE      DONE
        SHR     AL,1    ;   AL = AL/2   CHANGES CF 
        JNC     PRINT0  ;   if CF == 0
        MOV     DL, '1' ;   if CH == 1 print 1
        MOV     AH, 2
        INT     21H
        JMP PRINT
PRINT0:                 ;   print 0
        MOV     DL, '0'
        MOV     AH, 2
        INT     21H
        JMP PRINT       ; return to main
DONE:
        INT     21H
    RET