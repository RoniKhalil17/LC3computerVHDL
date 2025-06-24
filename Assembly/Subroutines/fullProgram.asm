.orig x0500

AND R0  R0  #0
BR valcon
player1bet  .STRINGZ    "\nPlayer 1 bet!\n"
player2bet  .STRINGZ    "\nPlayer 2 bet!\n"
player3bet  .STRINGZ    "\nPlayer 3 bet!\n"



valcon

createplayer
and r3, r3, #0  ;nulstiller r3.
add r3, r3, #3 ; antal spiller.
LEA R1, player1 ; loader adressen til arrayet ind
nySpiller and r2, r2, #0 ; sikker at den er nul
add r2, r2, #3  ;player navn bliver max på 3 bogstaver
loop        ; loop
GETC
OUT ;til at få bogstav
str r0, r1, #0  ; gemmer bogstavet
add r1, r1, #1  ;rykker en plads
add r2, r2, #-1 ;-1 så man kommer ud af loopet på det rigtige tidspunkt.
brnp loop   ;loop
add r1, r1, #1  ;rykker en plads for at gør plads til null termintor
LD  r0, startMoney
str r0, r1, #0  ; slut bogstavet

add r1, r1, #1 ; næste array
;str r0, r1, #0  ; checeker at den er kommet til næste array.
GETC
OUT; hvis 0 så er alle spiller med.
ld  r4, tiltal   ; laver char til tal
add r0, r0, r4  ; laver char til tal
brz done        ; hvis 0 bliver tastet ind så er alle spiller med.
add r3, r3, #-1
brp nySpiller

UARTPLAYER1
ST  R7  SAVE2_R7ex
AND R0  R0  #0
AND R2  R2  #0
AND R4  R4  #0
AND R3  R3  #0

AND R5  R5  #0
AND R6	R6  #0
ADD R5  R5  #5

	LD R2, IO_BASE; load IO_BASE and keep it in R2
    
    
 
    ; SEND TIL PROTOCOL
        LD  R4  HEADER
        
            CheckInputAvail11
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvail11    ; poll until data available
        
        STR R4  R2  x1E   ;send HEADER
        AND R4  R4  #0
        LD  R4  TYPEplayer1
        
            CheckInputAvail12
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvail12    ; poll until data available
        
        STR R4  R2  x1E   ;send type 
        AND R4  R4  #0
    
    sendplayer1LOOP    
    LDR R0 R1  #0
    
    CheckInputAvail13
	LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvail13    ; poll until data available
    
    STR R0  R2  x1E 
    ADD R1  R1  #1

	
    ADD R5  R5  #-1 
    BRz SHIFTbalance1
    
    BRnzp sendplayer1LOOP
    
SHIFTbalance1

    SRA R0  R0  #8
    
    CheckInputAvail14
	LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvail14    ; poll until data available
	
    STR R0  R2  x1E 
    
    LD  R7  SAVE2_R7ex
    RET

UARTPLAYER2
ST  R7  SAVE2_R7ex
AND R0  R0  #0
AND R2  R2  #0
AND R4  R4  #0
AND R3  R3  #0

AND R5  R5  #0
ADD R5  R5  #5

	LD R2, IO_BASE; load IO_BASE and keep it in R2
    
    
 
    ; SEND TIL PROTOCOL
        LD  R4  HEADER
        
            CheckInputAvail21
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvail21    ; poll until data available
        
        STR R4  R2  x1E   ;send HEADER
        AND R4  R4  #0
        LD  R4  TYPEplayer2
        
            CheckInputAvail22
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvail22    ; poll until data available
        
        STR R4  R2  x1E   ;send type 
        AND R4  R4  #0
    
    sendplayer2LOOP    
    LDR R0 R1  #0
    
    CheckInputAvail23
	LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvail23    ; poll until data available
    
    STR R0  R2  x1E 
    ADD R1  R1  #1
    
    ADD R5  R5  #-1  
    BRz SHIFTbalance2
    
    BRnzp sendplayer2LOOP
    
SHIFTbalance2

    SRA R0  R0  #8
    
    CheckInputAvail24
	LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvail24    ; poll until data available
	
    STR R0  R2  x1E 
    
    LD  R7  SAVE2_R7ex
    RET

UARTPLAYER3
ST  R7  SAVE2_R7ex
AND R0  R0  #0
AND R2  R2  #0
AND R4  R4  #0
AND R3  R3  #0

AND R5  R5  #0
ADD R5  R5  #5

	LD R2, IO_BASE; load IO_BASE and keep it in R2
    
    
 
    ; SEND TIL PROTOCOL
        LD  R4  HEADER
        
            CheckInputAvail31
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvail31    ; poll until data available
        
        STR R4  R2  x1E   ;send HEADER
        AND R4  R4  #0
        LD  R4  TYPEplayer3
        
            CheckInputAvail32
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvail32    ; poll until data available
        
        STR R4  R2  x1E   ;send type 
        AND R4  R4  #0
    
    sendplayer3LOOP    
    LDR R0 R1  #0
    
    CheckInputAvail33
	LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvail33    ; poll until data available
    
    STR R0  R2  x1E 
    ADD R1  R1  #1
    
    ADD R5  R5  #-1  
    BRz SHIFTbalance3
    
    BRnzp sendplayer3LOOP
    
SHIFTbalance3

    SRA R0  R0  #8
    
    CheckInputAvail34
	LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvail34    ; poll until data available
	
    STR R0  R2  x1E 
    
    LD  R7  SAVE2_R7ex
    RET



IO_BASE         .FILL xFE00
HEADER          .FILL x3F
TYPEplayer1     .FILL x88
TYPEplayer2     .FILL x89
TYPEplayer3     .FILL x87

SAVE2_R7ex .BLKW 1      ; Plads til at gemme R7


    ;nå alle spiller er med.
;;halt    ;er ikke done men det er en start
startMoney .fill #1000   ;er bare et eksempel på man kan start med penge
tilTal       .fill #-48
IO_BASE2    .FILL xFE00
HEADER2     .FILL x3F
TYPEbet1     .FILL x66
TYPEbet2     .FILL x67
TYPEbet3     .FILL x68

;;PseudoRandom 
done

;ST  R5  pseudotal
;;----BET----;;


newgame
AND R0  R0  #0
AND R2  R2  #0
AND R3  R3  #0
AND R4  R4  #0
AND R5  R5  #0
AND R6  R6  #0
AND R7  R7  #0

AND R1  R1  #0
LEA R1 player1
JSR UARTPLAYER1

AND R1  R1  #0
LEA R1 player2
JSR UARTPLAYER2

AND R1  R1  #0
LEA R1 player3
JSR UARTPLAYER3

;;--PLAYER1BET--;;
LEA R0  player1bet
PUTS
AND R0  R0  #0
LEA R1  player1
LDR R2  R1  #4
ST  R2  fillerscore
JSR betamount
LD  R0  amount
ST  R0  EXTRAbet1

;---PROTOCOL START FOR BET AMOUNT----

    AND R3  R3  #0
    AND R1  R1  #0
    LD R2, IO_BASE2; load IO_BASE and keep it in R2

    LD  R5  HEADER2
        
            CheckInputAvailBET1
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailBET1    ; poll until data available
            
        STR R5  R2  x1E   ;send HEADER
        AND R5  R5  #0
        LD  R5  TYPEbet1
        
            CheckInputAvailBET2
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailBET2    ; poll until data available
        
        STR R5  R2  x1E   ;send type 
        AND R5  R5  #0
        AND R3  R3  #0

;--- PROTOCOL SEND BET1 DATA
    LD R2, IO_BASE2; load IO_BASE and keep it in R2
    CheckInputAvailBET3
	LDR R1, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvailBET3    ; poll until data available
    
    STR R0  R2  x1E 
    
    SRA R0  R0  #8
    
    CheckInputAvailSH1
	LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvailSH1    ; poll until data available
	
    STR R0  R2  x1E 
    
    AND R2  R2  #0
;--- PROTOCOL END BET1 DATA

BR betplayer2

player1  .blkw #5  ; indholder 4 til navn, 1 til holde score, 10 til at indholde historik en til null termintor og buffer.
player2  .blkw #5
player3  .blkw #5

;;--PLAYER2BET--;;
betplayer2
LEA R0  player2bet
PUTS
AND R0  R0  #0
LEA R1  player2
LDR R2  R1  #4
ST  R2  fillerscore
JSR betamount2
LD  R0  amount
ST  R0  EXTRAbet2

;---PROTOCOL START FOR BET AMOUNT----

    AND R3  R3  #0
    AND R1  R1  #0
    LD R2, IO_BASE2; load IO_BASE and keep it in R2

    LD  R5  HEADER2
        
            CheckInputAvailBET4
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailBET4    ; poll until data available
            
        STR R5  R2  x1E   ;send HEADER
        AND R5  R5  #0
        LD  R5  TYPEbet2
        
            CheckInputAvailBET5
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailBET5    ; poll until data available
        
        STR R5  R2  x1E   ;send type 
        AND R5  R5  #0
        AND R3  R3  #0

;--- PROTOCOL SEND BET2 DATA
    AND R1  R1  #0
    AND R2  R2  #0
    LD R2, IO_BASE2; load IO_BASE and keep it in R2
    CheckInputAvailBET6
	LDR R1, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvailBET6    ; poll until data available
    
    STR R0  R2  x1E 
    
    SRA R0  R0  #8
    
    CheckInputAvailSH2
	LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvailSH2    ; poll until data available
	
    STR R0  R2  x1E 
    
    AND R2  R2  #0
;--- PROTOCOL END BET2 DATA

BR betplayer3

;;--PLAYER3BET--;;
betplayer3
LEA R0  player3bet
PUTS
AND R0  R0  #0
LEA R1  player3
LDR R2  R1  #4
ST  R2  fillerscore
JSR betamount3
LD  R0  amount
ST  R0  EXTRAbet3

;---PROTOCOL START FOR BET AMOUNT----

    AND R3  R3  #0
    AND R1  R1  #0
    LD R2, IO_BASE2; load IO_BASE and keep it in R2

    LD  R5  HEADER2
        
            CheckInputAvailBET7
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailBET7    ; poll until data available
            
        STR R5  R2  x1E   ;send HEADER
        AND R5  R5  #0
        LD  R5  TYPEbet3
        
            CheckInputAvailBET8
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailBET8    ; poll until data available
        
        STR R5  R2  x1E   ;send type 
        AND R5  R5  #0
        AND R3  R3  #0

;--- PROTOCOL SEND BET3 DATA
    AND R1  R1  #0
    AND R2  R2  #0
    LD R2, IO_BASE2; load IO_BASE and keep it in R2
    CheckInputAvailBET9
	LDR R1, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvailBET9    ; poll until data available
    
    STR R0  R2  x1E 
    
    SRA R0  R0  #8
    
    CheckInputAvailSH3
	LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvailSH3    ; poll until data available
	
    STR R0  R2  x1E 
    
    AND R2  R2  #0
;--- PROTOCOL END BET3 DATA

BR COLORBET1

newgame5
BRnzp newgame
betstr  .STRINGZ "\nHow much do you wish to bet? "

EXTRAbet1     .FILL   #0

EXTRAbet2     .FILL   #0

EXTRAbet3     .FILL   #0

amount  .FILL   #0
fillerscore   .FILL   #0
toolittle   .STRINGZ    "\nYou do not have enough chips!\n"

SAVE_R7 .BLKW 1      ; Plads til at gemme R7

EXtal     .FILL   #-48

EXtusind  .FILL   #999

EXhundrede .FILL  #99

betamount
betamount2
betamount3
ST R7, SAVE_R7 ;; Gem returadresse
BR skiponfirst
donthave
LEA R0  toolittle
PUTS
skiponfirst

AND R0  R0  #0
AND R1  R1  #0
AND R2  R2  #0
AND R3  R3  #0
AND R4  R4  #0
AND R6  R6  #0

LD  R4  EXtusind ;Counter værdi til at gange vores in værdi med 10 for 10, 100 og 1000

LEA R0  betstr

PUTS

AND R0  R0  #0

GETC
OUT

LD  R2  EXtal

ADD R0  R0  R2 ;; tal som bliver bettet

ADD R3  R3  R0 ;; Register til at gange R0

tusindloop
ADD R0  R0  R3
ADD R4  R4  #-1
BRp tusindloop

AND R3  R3  #0 ;; Reset register R3, så den kan holde multiplied værdi
ADD R3  R3  R0 ;; Holder vores tal for 1000

GETC
OUT  

ADD R0  R0  R2 ;; 100

AND R2  R2  #0 ;; Reset R2 så jeg kan bruge det til at holde en værdi

ADD R2  R2  R0  

LD  R1  EXhundrede

hundredeloop
ADD R0  R0  R2
ADD R1  R1  #-1
brp hundredeloop

ADD R0  R0  R3 ;; Vi har nu 1000 og 100 på en plads, mangler 10 og 1 cifret
ADD R1  R1  R0 ;;placeholder værdi
AND R3  R3  #0 
AND R4  R4  #0

ADD R4  R4  #9

LD R2   EXtal

GETC
OUT

ADD R0  R0  R2

ADD R3  R3  R0;;Værdi til at gange r0

tiloop
ADD R0  R0  R3
ADD R4  R4  #-1
brp tiloop

ADD R1  R1  R0; Holder 1000, 100 og 10

GETC
OUT

ADD R0  R0  R2

AND R3  R3  #0

ADD R3  R3  R0

ADD R0  R0  R1

AND R3  R3  #0

ADD R3  R0  #0 ;;Kopi af R0

NOT R3  R3 

ADD R3  R3  #1

LEA  R4  fillerscore

LDR R2  R4  #0

ADD R2  R2  R3
BRnz donthave

ST  R0  amount

LD R7, SAVE_R7
RET

;______ COLOR BETTING _______

COLORBET1
; --PLAYER 1 COLOR BET--
LEA R0, colorprompt1
PUTS
AND R0, R0, #0
GETC
OUT                 ; Read char
ST R0, EXTRAbetcolor1

; --- UART SEND COLOR BET ---
LD R2, IO_BASE3
LD R5, HEADER3

CheckColorAvail1
    LDR R3, R2, x1C
    BRzp CheckColorAvail1
    
STR R5, R2, x1E

LD R5, TYPEcolor1
CheckColorAvail2
    LDR R3, R2, x1C
    BRzp CheckColorAvail2
STR R5, R2, x1E

CheckColorAvail3
    LDR R3, R2, x1C
    BRzp CheckColorAvail3
STR R0, R2, x1E
BR COLORBET2


COLORBET2
; --PLAYER 2 COLOR1 BET--
LEA R0, colorprompt2
PUTS
AND R0, R0, #0
GETC
OUT                ; Read char
ST R0, EXTRAbetcolor2

; --- UART SEND COLOR2 BET ---
LD R2, IO_BASE3
LD R5, HEADER3

CheckColorAvail4
    LDR R3, R2, x1C
    BRzp CheckColorAvail4
STR R5, R2, x1E

LD R5, TYPEcolor2
CheckColorAvail5
    LDR R3, R2, x1C
    BRzp CheckColorAvail5
STR R5, R2, x1E

CheckColorAvail6
    LDR R3, R2, x1C
    BRzp CheckColorAvail6
STR R0, R2, x1E
BR COLORBET3

COLORBET3
; --PLAYER 3 COLOR BET--
LEA R0, colorprompt3
PUTS
AND R0, R0, #0
GETC
OUT                 ; Read char
ST R0, EXTRAbetcolor3

; --- UART SEND COLOR3 BET ---
LD R2, IO_BASE3
LD R5, HEADER3

CheckColorAvail7
    LDR R3, R2, x1C
    BRzp CheckColorAvail7
STR R5, R2, x1E

LD R5, TYPEcolor3
CheckColorAvail8
    LDR R3, R2, x1C
    BRzp CheckColorAvail8
STR R5, R2, x1E

CheckColorAvail9
    LDR R3, R2, x1C
    BRzp CheckColorAvail9
STR R0, R2, x1E

BR wheelbetnext

; Bet color options
newgame4
BR newgame5

colorprompt1   .STRINGZ "\nPlayer 1, choose a color (R=Red, B=Black, G=Green): \n"
colorprompt2   .STRINGZ "\nPlayer 2, choose a color (R=Red, B=Black, G=Green): \n"
colorprompt3   .STRINGZ "\nPlayer 3, choose a color (R=Red, B=Black, G=Green): \n"

EXTRAbetcolor1  .FILL #0
EXTRAbetcolor2  .FILL #0
EXTRAbetcolor3  .FILL #0

IO_BASE3 .FILL xFE00
HEADER3  .FILL x3F
TYPEnum1 .FILL x71
TYPEnum2 .FILL x72
TYPEnum3 .FILL x73
TYPEcolor1      .FILL x61
TYPEcolor2      .FILL x62
TYPEcolor3      .FILL x63

wheelbetnext
BR wheelbetnext1
newgame3
BR newgame4

tal     .FILL   #-48

tusind  .FILL   #999

hundrede .FILL  #99

wheelbet1   .STRINGZ    "\nPlayer 1, choose a number\n"
wheelbet2   .STRINGZ    "\nPlayer 2, choose a number\n"
wheelbet3   .STRINGZ    "\nPlayer 3, choose a number\n"

EXTRAbetnumber1 .FILL #0

EXTRAbetnumber2 .FILL #0

EXTRAbetnumber3 .FILL #0

EXamount  .FILL   #0

newgame2
BR newgame3

wheelbetnext1

;;--PLAYER1BET--;;
LEA R0  wheelbet1
PUTS
AND R0  R0  #0
JSR wheelbetamount
LD  R0  EXamount
ST  R0  EXTRAbetnumber1

;---PROTOCOL START FOR BET AMOUNT----

    AND R3  R3  #0
    AND R1  R1  #0
    LD R2, IO_BASE3; load IO_BASE and keep it in R2

    LD  R5  HEADER3
        
            CheckInputAvailNUM1
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailNUM1    ; poll until data available
            
        STR R5  R2  x1E   ;send HEADER
        AND R5  R5  #0
        LD  R5  TYPEnum1
        
            CheckInputAvailNUM2
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailNUM2    ; poll until data available
        
        STR R5  R2  x1E   ;send type 
        AND R5  R5  #0
        AND R3  R3  #0

;--- PROTOCOL SEND BET3 DATA
    AND R1  R1  #0
    AND R2  R2  #0
    LD R2, IO_BASE3; load IO_BASE and keep it in R2
    CheckInputAvailNUM3
	LDR R1, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvailNUM3    ; poll until data available
    
    STR R0  R2  x1E 
    
    AND R2  R2  #0
;--- PROTOCOL END BET3 DATA

BR wheelbetplayer2

newgame1
BR newgame2

;;--PLAYER2BET--;;
wheelbetplayer2
LEA R0  wheelbet2
PUTS
AND R0  R0  #0
JSR wheelbetamount2
LD  R0  EXamount
ST  R0  EXTRAbetnumber2

;---PROTOCOL START FOR BET AMOUNT----

    AND R3  R3  #0
    AND R1  R1  #0
    LD R2, IO_BASE3; load IO_BASE and keep it in R2

    LD  R5  HEADER3
        
            CheckInputAvailNUM4
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailNUM4    ; poll until data available
            
        STR R5  R2  x1E   ;send HEADER
        AND R5  R5  #0
        LD  R5  TYPEnum2
        
            CheckInputAvailNUM5
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailNUM5    ; poll until data available
        
        STR R5  R2  x1E   ;send type 
        AND R5  R5  #0
        AND R3  R3  #0

;--- PROTOCOL SEND BET3 DATA
    AND R1  R1  #0
    AND R2  R2  #0
    LD R2, IO_BASE3; load IO_BASE and keep it in R2
    CheckInputAvailNUM6
	LDR R1, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvailNUM6    ; poll until data available
    
    STR R0  R2  x1E 
    
    AND R2  R2  #0
;--- PROTOCOL END BET3 DATA

BR wheelbetplayer3

;;--PLAYER3BET--;;
wheelbetplayer3
LEA R0  wheelbet3
PUTS
AND R0  R0  #0
JSR wheelbetamount3
LD  R0  EXamount
ST  R0  EXTRAbetnumber3

;---PROTOCOL START FOR BET AMOUNT----

    AND R3  R3  #0
    AND R1  R1  #0
    LD R2, IO_BASE3; load IO_BASE and keep it in R2

    LD  R5  HEADER3
        
            CheckInputAvailNUM7
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailNUM7    ; poll until data available
            
        STR R5  R2  x1E   ;send HEADER
        AND R5  R5  #0
        LD  R5  TYPEnum3
        
            CheckInputAvailNUM8
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailNUM8    ; poll until data available
        
        STR R5  R2  x1E   ;send type 
        AND R5  R5  #0
        AND R3  R3  #0

;--- PROTOCOL SEND BET3 DATA
    AND R1  R1  #0
    AND R2  R2  #0
    LD R2, IO_BASE3; load IO_BASE and keep it in R2
    CheckInputAvailNUM9
	LDR R1, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvailNUM9    ; poll until data available
    
    STR R0  R2  x1E 
    
    AND R2  R2  #0
;--- PROTOCOL END BET3 DATA

BR btnjump

BR playrarr

SAVE3_R7 .BLKW 1      ; Plads til at gemme R7

playrarr


wheelbetamount
wheelbetamount2
wheelbetamount3
;;Hvilket tal vil du bette på?
ST R7, SAVE3_R7
AND R0  R0  #0
AND R1  R1  #0
AND R2  R2  #0
AND R3  R3  #0
AND R4  R4  #0
AND R6  R6  #0
LEA R0  numbet

PUTS

AND R0  R0  #0


ADD R4  R4  #9

LD R2   tal

GETC
OUT

ADD R0  R0  R2

ADD R3  R3  R0;;Værdi til at gange r0

tiloop2
ADD R0  R0  R3
ADD R4  R4  #-1
brp tiloop2

ADD R1  R1  R0;10

AND R0  R0  #0

GETC
OUT

ADD R0  R0  R2

AND R3  R3  #0

ADD R3  R3  R0

ADD R0  R0  R1

BR continue2

jump

BR newgame1

continue2

ST  R0  EXamount

LD R7, SAVE3_R7
RET

AND R2  R2  #0

ADD R2  R1  #0


;;----Button----;;
;;R5 er reserveret indtil efter wheel er kørt
btnjump


;;====Vælg hastighed====;;
LD R0, DATA_BASE         ; Load the button address
    AND R1  R1  0            ; Counter
INT_WAIT_SW:
    LDR R2  R0  x0B        ; Read the button
    BRz gonext        ; If not pressed we keep counting
    BR SWITCH_SEED_READY        ; If button is pressed we go to stop

;INC_COUNTER_SWITCH:
 ;          ; +1 on counter and go back
 ;   BR INT_WAIT_SW

SWITCH_SEED_READY:
    ADD R1  R1  1 
    LD R3  MASK        ; Load mask x001F for 5-bit
    AND R1  R1  R3        ; Mask to 5-bit
    ST R1  SWITCH_SEED        ; Save seed

    gonext
inputloop

LEA R0  btnstr

PUTS


; Create a random seed, making sure every time you load this game its random
; This is done by making the user click a button using the user delay as seed

AND R0  R0  #0

    LD R0, DATA_BASE         ; Load the button address
    AND R1  R1  0            ; Counter
INT_WAIT_BTN:
    LDR R2  R0  x0F        ; Read the button
    BRz INC_COUNTER        ; If not pressed we keep counting
    BR SEED_READY        ; If button is pressed we go to stop

INC_COUNTER:
    ADD R1  R1  1        ; +1 on counter and go back
    BR INT_WAIT_BTN

SEED_READY:
    LD R3  MASK        ; Load mask x001F for 5-bit
    AND R1  R1  R3        ; Mask to 5-bit
    ST R1  RNG_SEED        ; Save seed

;WAITING:            ; Making sure the button is gonna start the game if held down to long or something we just wait until the button is released
    ;LD R2, DATA_BASE
    ;LDR R0, R2, x0F
    ;BRp WAITING
;;--RANDOM NUMBER--;;

;; formel: X_n+1 = (a*X_n+c) modulus m
;; regler:
;; Vores første tal X_0 er et seed, valgt af os
;; Vores seed må ikke være mindre eller lig 0 og vores seed skal være mindre end modulus tallet
;; Tallene a, c og m er tal vi vælger. For at resultatet er pseudo random kræver det dog en relativ stor periode
;; Hvis perioden er for lille kan vi risikere et tydeligt loop, som 645764576457 osv.
;; Vi har en mulighed med Hull-Dobell læresætningen. Først og fremmest må c!=0 altid være sandt.
;; m og c SKAL være relativt prime dvs. m og c skal have størst fælles divisor 1.
;;a-1 skal kunne divideres med alle prime faktorer af m
;;a-1 skal kunne divideres med 4 hvis m kan divideres med 4
AND R0  R0  #0 ;Værdi til at holde resultat af (a*X_n+c)
AND R1  R1  #0 ;Register til at holde seed
AND R2  R2  #0 ;Værdi a
AND R3  R3  #0 ;Værdi c
AND R4  R4  #0 ;Modulus m
AND R5  R5  #0 ;Værdi til at holde a*X_n
; (R2*R1+R3) modulus m
; så vi skal udregne (R2*R1+R3) og så store det i et register, bruge JSR til at køre modulus subroutine og så får vi 1 tal tilbage
; Så kan vi bruge det tal til at køre det hele igen
; Jeg har brugt chat til at finde et sæt tal, som opfylder kraven for læresætningen
LD  R1  RNG_SEED
ADD R2  R2  #1
ADD R3  R3  #1
LD  R4  MOD23




loopA
ADD R5  R5  R1
ADD R2  R2  #-1
BRz nextstep
BRp loopA



nextstep
ADD R0  R0  R5
ADD R0  R0  R3

; her skal vi hoppe til modulus subroutine




;;MODULUS SUBROUTINE



AND R5  R5  #0 ; Værdi til at gemme det endelige pseudo random tal
AND R1  R1  #0
AND R2  R2  #0 
AND R3  R3  #0

ADD R1  R1  R0
;LD R1  DIV  

ADD R2  R2  R4
;LD R2  MOD
BR waitvalues
DATA_BASE   .FILL   xFE00
MASK        .FILL   x00FF
RNG_SEED    .FILL   x0053
SWITCH_SEED    .FILL   x0053
MOD23           .FILL   #23
waitvalues

ADD R3  R3  R4
;LD R3  MOD  ;COUNTER


NOT R2  R2
ADD R2  R2  #1


ADD R1  R1  R2
BRz found ;hvis lig 0, så er mod lig R1 (er der en fejl her?)

BRn notdiv ; hvis den er negativ kan vi ikke dividere og der er ikke en rest, vores divisor er derfor lig mod

loopB
ADD R1  R1  R2
BRp loopB
BRz lastcheck
BRn foundstep3

lastcheck
ADD R1  R1  R2
BRz found
BRn foundstep3



foundstep3 ;hvilke scenarier er dette for? 1. Hvis vores loop rammer negativ r1. 2. Hvis last check bliver negativt
NOT R2  R2
ADD R2  R2  #1
ADD R1  R1  R2
ADD R5  R1  #0
BRnzp hop1



found
ADD R5  R1  #0
brnzp hop1

notdiv
AND R1  R1  #0
ADD R1  R1  R0
ADD R5  R5  R1
brnzp hop1 ;;skal hoppe et andet sted hen



;DIV .FILL #27

;MOD .FILL #4


hop1
ST  R5  RNG_SEED


;;Wheel Subroutine

click
AND R0  R0  #0
AND R1  R1  #0
AND R2  R2  #0
AND R3  R3  #0
AND R4  R4  #0
AND R6  R6  #0

ADD R1  R1  #4
ST  R1  kalddenwhatever

;LD  R1  len

BR continue
;;----VÆRDIER----;;

playerbet    .STRINGZ    "\nHow many players are betting?"

tempcount   .FILL   #0

playercount .FILL   #0

pseudotal .FILL #0

sekund  .FILL   #500

teller  .FILL   #111

slower  .FILL   #1

slowest .FILL   #1

SSEG   .fill   xFE12

alsoStartMoney  .FILL   #0

btnstr  .STRINGZ "\nPress button to spin wheel\n"

numbet  .STRINGZ "\nWhich number do you wish to bet on? "

Hjul    .FILL   x0001
        .FILL   x0002
        .FILL   x0003
        .FILL   x0004
        .FILL   x0005
        .FILL   x0006
        .FILL   x0007
        .FILL   x0008
        .FILL   x0009
        .FILL   x000A ;;10
        .FILL   X000B
        .FILL   X000C
        .FILL   X000D
        .FILL   X000E
        .FILL   X000F
        .FILL   X10
        .FILL   X11
        .FILL   X12 ;; 18
        .FILL   X13
        .FILL   X14
        .FILL   X15
        
len     .FILL   #21

RNG_SEED2   .FILL   #0

loopcounter .FILL   #800

speedinc    .FILL   #1 ;;215

largespeedinc .FILL #1    ;; 500

delaycount  .FILL   #1 ;; 200

IO_BASE1         .FILL xFE00
HEADER1          .FILL x3F
TYPEwheel       .FILL x99
STOPbytewheel   .FILL x76

kalddenwhatever .FILL #4

newgameyes1
BR jump
        
continue

;--- PROTOCOL FOR UART WHEEL SEND -----
LD R2, IO_BASE1; load IO_BASE and keep it in R2

    LD  R5  HEADER1
        
            CheckInputAvailWHE1
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailWHE1    ; poll until data available
            
        STR R5  R2  x1E   ;send HEADER
        AND R5  R5  #0
        LD  R5  TYPEwheel
        
            CheckInputAvailWHE2
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailWHE2    ; poll until data available
        
        STR R5  R2  x1E   ;send type 
        AND R5  R5  #0
        AND R3  R3  #0
;--- END WHEEL START PROTCOL----

LD  R6  SWITCH_SEED

ADD R6  R6  #-1
BRz slowerwheel
BRnp fastwheel

fastwheel
LD  R6  speedinc ;; increase af delays
br jumptowheel

slowerwheel
LD  R6  largespeedinc
BR alsojumptowheel

jumptowheel
alsojumptowheel
LD  R1  kalddenwhatever
AND R4  R4  #0 ;; resetter register R4 til at holde stigende delay værdi
loopofwheel
LEA R5  Hjul ;; array[N]+1
LD  R3  len  ;; længde af arr
ST  R1  kalddenwhatever


Loop21
LDR R0  R5  #0
STI R0  SSEG

;--- PROTOCOL SEND WHEEL DATA
LD R2, IO_BASE1; load IO_BASE and keep it in R2
CheckInputAvailWHE3
	LDR R1, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvailWHE3    ; poll until data available
    
    STR R0  R2  x1E 
    AND R2  R2  #0
;--- PROTOCOL END WHEEL DATA

ADD R4  R4  R6 ;;Øger R4 med R6

LD  R2  DelayCount ;;gentager delay loop
DelayRepeat
ADD R7  R4  #0 ;; kopi af delayværdi

DelayLoop
ADD R7  R7  #-1
BRp DelayLoop ;;hvis delay loop ikke er færdigt så repeat

ADD R2  R2  #-1
BRp DelayRepeat ;; hvis ydre delay loop ikke er færdigt så repeat

ADD R5  R5  #1 ;; incrementer arr
ADD R3  R3  #-1
BRp Loop21
LD  R1  kalddenwhatever
ADD R1  R1  #-1
BRp loopofwheel
        
        
LEA R5  Hjul ;; start forfra i arr til endelige loop
LD  R3  RNG_SEED ;; tallet bliver valgt af RNG seed/modulus af (a*RNG_seed+c)

FinalLoop
LDR R0  R5  #0
STI R0  SSEG

;--- PROTOCOL SEND WHEEL DATA
LD R2, IO_BASE1; load IO_BASE and keep it in R2
CheckInputAvailWHE4
	LDR R1, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvailWHE4    ; poll until data available
    
    STR R0  R2  x1E 
    AND R2  R2  #0
;--- PROTOCOL END WHEEL DATA

LD  R2  DelayCount ;; delay er det samme som før
FinalDelayRepeat
ADD R7  R4  #0

FinalDelayLoop
ADD R7  R7  #-1
BRp FinalDelayLoop

ADD R2  R2  #-1
BRp FinalDelayRepeat

ADD R5  R5  #1
ADD R3  R3 #-1
BRp FinalLoop

ST  R0  lastsave

;---- PROTOCOL STOP WHEEL
    AND R5  R5 #0
    AND R3  R3 #0
    LD R2, IO_BASE1; load IO_BASE and keep it in R2
    LD R5 STOPbytewheel

    CheckInputAvailWHE6
	LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	BRzp CheckInputAvailWHE6    ; poll until data available

    STR R5  R2  x1E
;--- PROTOCOL END WHEEL

;; Eksempel: Indsæt nogle værdier (én ad gangen)
LD  R0  lastsave
JSR INSERT_NEW

BR leavefifo

;HALT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SUBROUTINE: INSERT_NEW
;; Input: R0 = ny værdi som skal i array[0]
;; Skubber alle værdier nedad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
INSERT_NEW
    ST R1, save1
    ST R2, save2
    ST R3, save3
    ST R4, save4

    LEA R1, buffer      ; R1 -> start af array
    LD  R2, arrlen      ; R2 = 10 (længde)
    ADD R2, R2, #-2     ; Sidste index at flytte: 8 (første bliver overskrevet)
    
shift_loop
    ADD R3, R1, R2      ; R3 = &buffer[i]
    LDR R4, R3, #0      ; R4 = buffer[i]
    ADD R3, R3, #1      ; R3 = &buffer[i+1]
    STR R4, R3, #0      ; buffer[i+1] = buffer[i]

    ADD R2, R2, #-1
    BRzp shift_loop

    ;; Gem ny værdi i buffer[0]
    LEA R1, buffer
    STR R0, R1, #0

    ;; Restore og return
    LD R1, save1
    LD R2, save2
    LD R3, save3
    LD R4, save4
    RET


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DATA
arrlen .FILL #10
buffer .BLKW #10

save1  .BLKW #1
save2  .BLKW #1
save3  .BLKW #1
save4  .BLKW #1

newgameyes
BR newgameyes1

leavefifo

JSR UARTHistoricSTART

LEA R1, buffer     ; Point to start of array
LD  R2, arrlen     ; Number of elements = 10

send_spinsloop
LDR R0, R1, #0     ; Load next value into R0 (for UART sending)
JSR UARTHistoric      ;subroutine to send R0
ADD R1, R1, #1     ; Move to next buffer slot
ADD R2, R2, #-1
BRp send_spinsloop


BR hop2
;;--WINMULTIPLYER--;;
;; R0 og R2 er reserveret værdier, som holder, henholdsvis hjultal og bet tal.
hop2


;;--PLAYER1--;;
LEA R0  player1winloss
PUTS
AND R0  R0  #0


LEA R2  betnumber1
LDR R2  R2  #0
LDR R5  R2  #0
LEA R3  EXTRAplayer1
LDR R4  R3  #0 ;; rigtige adresse
ADD R4  R4  #4
LDR R3  R4  #0 ;; Værdi af score
LEA R0  bet1
LDR R0  R0  #0
LDR R1  R0  #0
JSR winloss1
BR winlossplayer2

;;--PLAYER2--;;
winlossplayer2
LEA R0  player2winloss
PUTS
AND R0  R0  #0

LEA R2  betnumber2
LDR R2  R2  #0
LDR R5  R2  #0
LEA R3  EXTRAplayer2
LDR R4  R3  #0 ;; rigtige adresse
ADD R4  R4  #4
LDR R3  R4  #0 ;; Værdi af score
LEA R0  bet2
LDR R0  R0  #0
LDR R1  R0  #0
JSR winloss2
BR winlossplayer3

;;--PLAYER3--;;
winlossplayer3
LEA R0  player3winloss
PUTS
AND R0  R0  #0

LEA R2  betnumber3
LDR R2  R2  #0
LDR R5  R2  #0

LEA R0  bet3
LDR R0  R0  #0
LDR R1  R0  #0

LEA R3  EXTRAplayer3
LDR R4  R3  #0 ;; rigtige adresse
ADD R4  R4  #4
LDR R3  R4  #0 ;; Værdi af score
JSR winloss3

BR colorWINLOSS

winstr  .STRINGZ "\nYou won on number!\n"

losestr .STRINGZ "\nYou lost on number!\n"

player1winloss  .STRINGZ    "\nChecking player 1 win/loss\n"
player2winloss  .STRINGZ    "\nChecking player 2 win/loss\n"
player3winloss  .STRINGZ    "\nChecking player 3 win/loss\n"

betcolor1   .FILL   EXTRAbetcolor1
betcolor2   .FILL   EXTRAbetcolor2
betcolor3   .FILL   EXTRAbetcolor3

bet1     .FILL   EXTRAbet1

betnumber1 .FILL EXTRAbetnumber1

bet2     .FILL   EXTRAbet2

betnumber2 .FILL EXTRAbetnumber2

bet3     .FILL   EXTRAbet3
betnumber3 .FILL EXTRAbetnumber3

EXTRAplayer1    .FILL player1
EXTRAplayer2    .FILL player2
EXTRAplayer3    .FILL player3

lastsave    .FILL   #0

winloss1
winloss2
winloss3
ST R7, SAVE2_R7

NOT R5  R5  

ADD R5  R5  #1

LD  R0  lastsave

ADD R0  R0  R5
BRz wonbet
BRnp lostbet

;; multiply by x factor
wonbet
LEA R0  winstr

PUTS

;LD  R1  bet -- burde ligge i spillerens egen del

;LD  R2  betnumber - samme som bet

LD  R6  twentyone
AND R5  R5  #0
ADD R5  R1  #0
multiloop
ADD R1  R1  R5
ADD R6  R6  #-1
BRp multiloop
BRnz addscore
;;--ADD CURRENCY TO SCORE--;;
;;Nuværende vigtige register er R1
addscore

ADD R1  R1  R3

STR R1  R4  #0

LD R7, SAVE2_R7
RET

BR colorWINLOSS

lostbet

LEA R0  losestr

PUTS

;;--Minus score--;;

;;LD  R1  bet


NOT R1  R1

ADD R1  R1  #1

ADD R3  R3  R1

STR R3  R4  #0

LD R7, SAVE2_R7
RET

BR colorWINLOSS

SAVE2_R7 .BLKW 1      ; Plads til at gemme R7

jump2
BR newgameyes

colorWINLOSS
AND R0  R0  #0
AND R1  R1  #0
AND R2  R2  #0
AND R3  R3  #0
AND R4  R4  #0
AND R5  R5  #0
AND R6  R6  #0
; ================================
; COLOR WIN/LOSS PLAYER 1
; ================================

LEA R0  player1winloss
PUTS
AND R0  R0  #0

LD R0, lastsave
JSR GET_WIN_COLOR
LEA R1, betcolor1
LDR R1  R1  #0
LDR R2  R1  #0
NOT R2, R2
ADD R2, R2, #1
ADD R0, R0, R2
BRz color_win1
BRnzp color_lose1

color_win1
LEA R0, winstrCOLOR
PUTS
LEA R1, bet1         ; Bet amount
LDR R1  R1  #0
LDR R5  R1  #0
LEA R2, betcolor1
LDR R2  R2  #0
LDR R6  R2  #0
LD R3, RED
NOT R3, R3
ADD R3, R3, #1
ADD R0, R6, R3
BRz color_double1
LD R3, BLACK
NOT R3, R3
ADD R3, R3, #1
ADD R0, R6, R3
BRz color_double1
BRnzp color_twentyone1

color_double1
ADD R6, R5, R5
BRnzp addcolor1

color_twentyone1
LD  R2 twentyone
AND R6  R6  #0
ADD R6  R6  R5
color_loop1
ADD R6, R6, R5
ADD R2, R2, #-1
BRp color_loop1
BRnz addcolor1

addcolor1
LEA R2, EXTRAplayer1
LDR R3, R2, #0
ADD R3, R3, #4
LDR R4, R3, #0
ADD R6, R6, R4
STR R6, R3, #0
BRnzp color_check2

color_lose1
LEA R0, losestrCOLOR
PUTS
;;substract bet amount from balance
LEA R1, bet1         ; Bet amount
LDR R1  R1  #0
LDR R5  R1  #0

NOT R5  R5
ADD R5  R5  #1

LEA R2, EXTRAplayer1
LDR R3, R2, #0
ADD R3, R3, #4
LDR R4, R3, #0
ADD R6, R4, R5
STR R6, R3, #0
BRnzp color_check2

; ================================
; COLOR WIN/LOSS PLAYER 2
; ================================
color_check2
AND R0  R0  #0
AND R1  R1  #0
AND R2  R2  #0
AND R3  R3  #0
AND R4  R4  #0
AND R5  R5  #0
AND R6  R6  #0

LEA R0  player2winloss
PUTS
AND R0  R0  #0

LD R0, lastsave
JSR GET_WIN_COLOR
LEA R1, betcolor2
LDR R1  R1  #0
LDR R2  R1  #0
NOT R2, R2
ADD R2, R2, #1
ADD R0, R0, R2
BRz color_win2
BRnzp color_lose2

color_win2
LEA R0, winstrCOLOR
PUTS
LEA R1, bet2         ; Bet amount
LDR R1  R1  #0
LDR R5  R1  #0
LEA R2, betcolor2
LDR R2  R2  #0
LDR R6  R2  #0
LD R3, RED
NOT R3, R3
ADD R3, R3, #1
ADD R0, R6, R3
BRz color_double2
LD R3, BLACK
NOT R3, R3
ADD R3, R3, #1
ADD R0, R6, R3
BRz color_double2
BRnzp color_twentyone2

color_double2
ADD R6, R5, R5
BRnzp addcolor2

color_twentyone2
LD  R2 twentyone
AND R6  R6  #0
ADD R6  R6  R5
color_loop2
ADD R6, R6, R5
ADD R2, R2, #-1
BRp color_loop2
BRnz addcolor2

addcolor2
LEA R2, EXTRAplayer2
LDR R3, R2, #0
ADD R3, R3, #4
LDR R4, R3, #0
ADD R6, R6, R4
STR R6, R3, #0
BRnzp color_check3

color_lose2
LEA R0, losestrCOLOR
PUTS
;;substract bet amount from balance
LEA R1, bet2         ; Bet amount
LDR R1  R1  #0
LDR R5  R1  #0

NOT R5  R5
ADD R5  R5  #1

LEA R2, EXTRAplayer2
LDR R3, R2, #0
ADD R3, R3, #4
LDR R4, R3, #0
ADD R6, R4, R5
STR R6, R3, #0
BRnzp color_check3

; ================================
; COLOR WIN/LOSS PLAYER 3
; ================================
color_check3
AND R0  R0  #0
AND R1  R1  #0
AND R2  R2  #0
AND R3  R3  #0
AND R4  R4  #0
AND R5  R5  #0
AND R6  R6  #0

LEA R0  player3winloss
PUTS
AND R0  R0  #0

LD R0, lastsave
JSR GET_WIN_COLOR
LEA R1, betcolor3
LDR R1  R1  #0
LDR R2  R1  #0
NOT R2, R2
ADD R2, R2, #1
ADD R0, R0, R2
BRz color_win3
BRnzp color_lose3

color_win3
LEA R0, winstrCOLOR
PUTS
LEA R1, bet3         ; Bet amount
LDR R1  R1  #0
LDR R5  R1  #0
LEA R2, betcolor3
LDR R2  R2  #0
LDR R6  R2  #0
LD R3, RED
NOT R3, R3
ADD R3, R3, #1
ADD R0, R6, R3
BRz color_double3
LD R3, BLACK
NOT R3, R3
ADD R3, R3, #1
ADD R0, R6, R3
BRz color_double3
BRnzp color_twentyone3

color_double3
ADD R6, R5, R5
BRnzp addcolor3

color_twentyone3
LD  R2 twentyone
AND R6  R6  #0
ADD R6  R6  R5
color_loop3
ADD R6, R6, R5
ADD R2, R2, #-1
BRp color_loop3
BRnz addcolor3

addcolor3
LEA R2, EXTRAplayer3
LDR R3, R2, #0
ADD R3, R3, #4
LDR R4, R3, #0
ADD R6, R6, R4
STR R6, R3, #0
BRnzp restart

color_lose3
LEA R0, losestrCOLOR
PUTS
;;substract bet amount from balance
LEA R1, bet3         ; Bet amount
LDR R1  R1  #0
LDR R5  R1  #0

NOT R5  R5
ADD R5  R5  #1

LEA R2, EXTRAplayer3
LDR R3, R2, #0
ADD R3, R3, #4
LDR R4, R3, #0
ADD R6, R4, R5
STR R6, R3, #0
BRnzp restart


restart
LEA R0  repeatbet

PUTS

LEA R0  yes

PUTS

LEA R0  no

PUTS

AND R0  R0  #0
AND R1  R1  #0
AND R2  R2  #0
AND R3  R3  #0
AND R4  R4  #0
AND R6  R6  #0

;;--Tjek for at se om spillet skal fortsætte--;;

IN

LD  R1  EXTRAtal

ADD R0  R0  R1

ADD R0  R0  #-1
brz jump2
brnp stop
realbet  .FILL   #0


twentyone   .FILL   #20
EXTRAtal    .FILL #-48

RED   .FILL x0052 ; ASCII 'R'
BLACK .FILL x0042 ; ASCII 'B'
GREEN .FILL x0047 ; ASCII 'G'

winstrCOLOR  .STRINGZ "\nYou won on color!\n"

losestrCOLOR .STRINGZ "\nYou lost on color!\n"

buststr .STRINGZ "\nYou've gone bust! "

repeatbet .STRINGZ "\nDo you want to bet again? "

yes     .STRINGZ "\nIf yes, press 1! "

no      .STRINGZ "\nIf no, press any other button! "


stop
halt


UARTHistoricSTART
LD R2, IO_BASE4; load IO_BASE and keep it in R2
    
 
    ; SEND TIL PROTOCOL
        LD  R4  HEADER4
        
            CheckInputAvailHIS1
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailHIS1    ; poll until data available
        
        STR R4  R2  x1E   ;send HEADER
        AND R4  R4  #0
        LD  R4  TYPEhistoric
        
            CheckInputAvailHIS2
	        LDR R3, R2, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailHIS2    ; poll until data available
        
        STR R4  R2  x1E   ;send type 
        AND R4  R4  #0
RET

UARTHistoric

    AND R3  R3  #0
    LD  R4  IO_BASE4

        CheckInputAvailHIS3
	        LDR R3, R4, x1C   ; load IO_BASE+1C  (xFE1C: serial-output status register)
	        BRzp CheckInputAvailHIS3    ; poll until data available
        
        STR R0  R4  x1E   
RET

IO_BASE4         .FILL xFE00
HEADER4          .FILL x3F
TYPEhistoric       .FILL x51
GREENNUMBER     .FILL   #21

; Wheel color mapping: returns R0 = 'R', 'B', or 'G' based on lastsave
; 0 = G, evens = B, odds = R
GET_WIN_COLOR
LD R1, GREENNUMBER
NOT R1, R1
ADD R1, R1, #1        ; R1 = -21
ADD R2, R0, R1        ; R2 = R0 - 21
BRz green_case        ; If R0 == 21, jump

AND R1, R0, #1        ; Check LSB for even/odd
BRz black_case        ; Even = black

LD R0, RED
RET

black_case
LD R0, BLACK
RET

green_case
LD R0, GREEN
RET



.end
