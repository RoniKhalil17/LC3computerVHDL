.orig x0500

AND R0  R0  #0
AND R1  R1  #0
AND R2  R2  #0
AND R4  R4  #0
AND R3  R3  #0

AND R5  R5  #0
ADD R5  R5  #15

	LD R2, IO_BASE; load IO_BASE and keep it in R2
    LEA R1  player1
    
    
 
    ; SEND TIL PROTOCOL
        LD  R4  HEADER
        STR R4  R2  x1E   ;send HEADER
        AND R4  R4  #0
        LD  R4  TYPE
        STR R4  R2  x1E   ;send type 
        AND R4  R4  #0
    
    LOOP    
    LDR R0 R1  #0
    
    CheckInputAvail
	LDR R4, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvail    ; poll until data available
    
    STR R0  R2  x1E 
    ADD R1  R1  #1
    
    ADD R5  R5  #-1  
    BRz STOPBYTE
    
    BRnzp LOOP
    



STOPBYTE HALT
 ;   LD  R4  STOP
  ;  STR R4  R2  x1E   ;send Stopbyte
   ; AND R4  R4  #0

; Base address of LC3 I/O registers
IO_BASE .FILL xFE00
HEADER  .FILL x3F
TYPE    .FILL x88
STOP    .FILL xE3

player1 .FILL x0041  ; 'A' 1
        .FILL x0042  ; 'B' 2
        .FILL x0043  ; 'C' 3
        .FILL #0    ;null terminator
        .FILL #100  ;SALDO
        .FILL #0  ; sidste 10 spins
        .FILL #0  ; 
        .FILL #0  ; 
        .FILL #0
        .FILL #0  ; 
        .FILL #0  ; 
        .FILL #0  ; 
        .FILL #0
        .FILL #0  ; 
        .FILL #0  ; 

        

.end
