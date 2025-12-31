            .ORG    0000H 

            JMP     M1 
            .ORG    $+2 

M1:         LXI     SP,010000Q 
            LXI     H,006000Q 
M2:         MOV     C,M 
            MOV     A,M 
            OUT     0100Q 
            .ORG    $+1 
            MOV     A,L 
            OUT     000Q 
M3:         MOV     A,C 
            OUT     002Q 
            .ORG    $+1 
M4:         CALL    SKL 
            .ORG    $+2 
            CPI     010Q 
            .ORG    $+1 
            JNC     M11 
            .ORG    $+2 
            MOV     B,A 
            MOV     A,C 
            RAL      
            RAL      
            RAL      
            ANI     370Q 
            .ORG    $+1 
            ORA     B 
            MOV     C,A 
            JMP     M3 
            .ORG    $+2 
M11:        CPI     010Q 
            .ORG    $+1 
            JNZ     M12 
            .ORG    $+2 
            MOV     H,C 
            JMP     M2 
            .ORG    $+2 
M12:        CPI     011Q 
            .ORG    $+1 
            JNZ     M13 
            .ORG    $+2 
            MOV     L,C 
            JMP     M2 
            .ORG    $+2 
M13:        CPI     012Q 
            JNZ     M14 
            .ORG    $+2 
            MOV     M,C 
            INX     H 
            JMP     M2 
            .ORG    $+2 
M14:        CPI     013Q 
            .ORG    $+1 
            JNZ     M4 
            .ORG    $+2 
            PCHL     
            .ORG    $+1 
SKL:        MVI     A,000Q 
            .ORG    $+1 
            OUT     003Q 
            .ORG    $+1 
M5:         IN      003Q 
            .ORG    $+1 
            ANI     017Q 
            .ORG    $+1 
            CPI     017Q 
            .ORG    $+1 
            JNZ     M5 
            .ORG    $+2 
            CALL    DL 
            .ORG    $+2 
            PUSH    D 
M8:         MVI     D,003Q 
            .ORG    $+1 
            MVI     E,376Q 
            .ORG    $+1 
M7:         MOV     A,E 
            OUT     003Q 
            .ORG    $+1 
            RLC      
            MOV     E,A 
            IN      003Q 
            .ORG    $+1 
            ANI     017Q 
            .ORG    $+1 
            CPI     017Q 
            .ORG    $+1 
            JNZ     M6 
            .ORG    $+2 
            DCR     D 
            MOV     A,D 
            CPI     377Q 
            .ORG    $+1 
            JNZ     M7 
            .ORG    $+2 
            JMP     M8 
            .ORG    $+2 
M6:         CALL    DL 
            .ORG    $+2 
M10:        RRC      
            JNC     M9 
            .ORG    $+2 
            PUSH    PSW 
            MOV     A,D 
            ADI     004Q 
            .ORG    $+1 
            MOV     D,A 
            POP     PSW 
            JMP     M10 
            .ORG    $+2 
M9:         MOV     A,D 
            POP     D 
            RET      
DL:         PUSH    PSW 
            PUSH    D 
            LXI     D,001016Q 
            .ORG    $+2 
            POP     D 
            POP     PSW 
            RET      
