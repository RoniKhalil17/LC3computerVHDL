.orig x0500

AND R0  R0  #0
BR valcon
betstr  .STRINGZ "How much do you wish to bet? "
player1bet  .STRINGZ    "Player 1 bet!\n"
player2bet  .STRINGZ    "Player 2 bet!\n"
player3bet  .STRINGZ    "Player 3 bet!\n"

wheelbet1   .STRINGZ    "Player 1, choose a number\n"
wheelbet2   .STRINGZ    "Player 2, choose a number\n"
wheelbet3   .STRINGZ    "Player 3, choose a number\n"
amount  .FILL   #0
SAVE_R7 .BLKW 1      ; Plads til at gemme R7

valcon

createplayer
and r3, r3, #0  ;nulstiller r3.
add r3, r3, #3 ; antal spiller.
LEA R1, player1 ; loader adressen til arrayet ind
nySpiller and r2, r2, #0 ; sikker at den er nul
add r2, r2, #3  ;player navn bliver max på 3 bogstaver
loop        ; loop
in        ;til at få bogstav
str r0, r1, #0  ; gemmer bogstavet
add r1, r1, #1  ;rykker en plads
add r2, r2, #-1 ;-1 så man kommer ud af loopet på det rigtige tidspunkt.
brnp loop   ;loop
add r1, r1, #1  ;rykker en plads for at gør plads til null termintor
LD  r0, startMoney
str r0, r1, #0  ; slut bogstavet

add r1, r1, #1 ; næste array
;str r0, r1, #0  ; checeker at den er kommet til næste array.
in    ; hvis 0 så er alle spiller med.
ld  r4, tiltal   ; laver char til tal
add r0, r0, r4  ; laver char til tal
brz done        ; hvis 0 bliver tastet ind så er alle spiller med.
add r3, r3, #-1
brp nySpiller
    ;nå alle spiller er med.
;;halt    ;er ikke done men det er en start
startMoney .fill #300   ;er bare et eksempel på man kan start med penge
tilTal       .fill #-48
player1  .blkw #5  ; indholder 4 til navn, 1 til holde score, 10 til at indholde historik en til null termintor og buffer.
player2  .blkw #5
player3  .blkw #5

;;PseudoRandom 
done

;ST  R5  pseudotal
;;----BET----;;


newgame

;;--PLAYER1BET--;;
LEA R0  player1bet
PUTS
AND R0  R0  #0
JSR betamount
LD  R0  amount
ST  R0  bet1
BR betplayer2

;;--PLAYER2BET--;;
betplayer2
LEA R0  player2bet
PUTS
AND R0  R0  #0
JSR betamount2
LD  R0  amount
ST  R0  bet2
BR betplayer3

;;--PLAYER3BET--;;
betplayer3
LEA R0  player3bet
PUTS
AND R0  R0  #0
JSR betamount3
LD  R0  amount
ST  R0  bet3
BR moneybetdone

betamount
betamount2
betamount3
ST R7, SAVE_R7 ;; Gem returadresse
AND R0  R0  #0
AND R1  R1  #0
AND R2  R2  #0
AND R3  R3  #0
AND R4  R4  #0
AND R6  R6  #0

LD  R4  tusind ;Counter værdi til at gange vores in værdi med 10 for 10, 100 og 1000

LEA R0  betstr

PUTS

AND R0  R0  #0

IN

LD  R2  tal

ADD R0  R0  R2 ;; tal som bliver bettet

ADD R3  R3  R0 ;; Register til at gange R0

tusindloop
ADD R0  R0  R3
ADD R4  R4  #-1
BRp tusindloop

AND R3  R3  #0 ;; Reset register R3, så den kan holde multiplied værdi
ADD R3  R3  R0 ;; Holder vores tal for 1000

IN  

ADD R0  R0  R2 ;; 100

AND R2  R2  #0 ;; Reset R2 så jeg kan bruge det til at holde en værdi

ADD R2  R2  R0  

LD  R1  hundrede

hundredeloop
ADD R0  R0  R2
ADD R1  R1  #-1
brp hundredeloop

ADD R0  R0  R3 ;; Vi har nu 1000 og 100 på en plads, mangler 10 og 1 cifret
ADD R1  R1  R0 ;;placeholder værdi
AND R3  R3  #0 
AND R4  R4  #0

ADD R4  R4  #9

LD R2   tal

IN

ADD R0  R0  R2

ADD R3  R3  R0;;Værdi til at gange r0

tiloop
ADD R0  R0  R3
ADD R4  R4  #-1
brp tiloop

ADD R1  R1  R0; Holder 1000, 100 og 10

IN

ADD R0  R0  R2

AND R3  R3  #0

ADD R3  R3  R0

ADD R0  R0  R1

ST  R0  amount

LD R7, SAVE_R7
RET



;player 1's bet amount




moneybetdone

;;--PLAYER1BET--;;
LEA R0  wheelbet1
PUTS
AND R0  R0  #0
JSR wheelbetamount
LD  R0  amount
ST  R0  betnumber1
BR wheelbetplayer2

;;--PLAYER2BET--;;
wheelbetplayer2
LEA R0  wheelbet2
PUTS
AND R0  R0  #0
JSR wheelbetamount2
LD  R0  amount
ST  R0  betnumber2
BR wheelbetplayer3

;;--PLAYER3BET--;;
wheelbetplayer3
LEA R0  wheelbet3
PUTS
AND R0  R0  #0
JSR wheelbetamount3
LD  R0  amount
ST  R0  betnumber3
BR btnjump


wheelbetamount
wheelbetamount2
wheelbetamount3
;;Hvilket tal vil du bette på?
ST R7, SAVE_R7
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

IN

ADD R0  R0  R2

ADD R3  R3  R0;;Værdi til at gange r0

tiloop2
ADD R0  R0  R3
ADD R4  R4  #-1
brp tiloop2

ADD R1  R1  R0;10

AND R0  R0  #0

IN

ADD R0  R0  R2

AND R3  R3  #0

ADD R3  R3  R0

ADD R0  R0  R1

BR continue2

jump

BR newgame

continue2

ST  R0  amount

LD R7, SAVE_R7
RET

AND R2  R2  #0

ADD R2  R1  #0

;;----Button----;;
;;R5 er reserveret indtil efter wheel er kørt
btnjump
inputloop

LEA R0  btnstr

PUTS

AND R0  R0  #0
AND R1  R1  #0
AND R3  R3  #0
AND R4  R4  #0
AND R6  R6  #0

; Create a random seed, making sure every time you load this game its random
; This is done by making the user click a button using the user delay as seed

    LD R0, DATA_BASE         ; Load the button address
    AND R1, R1, 0            ; Counter
INT_WAIT_BTN:
    LDR R2, R0, x0F        ; Read the button
    BRz INC_COUNTER        ; If not pressed we keep counting
    BR SEED_READY        ; If button is pressed we go to stop

INC_COUNTER:
    ADD R1, R1, 1        ; +1 on counter and go back
    BR INT_WAIT_BTN

SEED_READY:
    LD R3, MASK        ; Load mask x001F for 5-bit
    AND R1, R1, R3        ; Mask to 5-bit
    ST R1, RNG_SEED        ; Save seed

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
ADD R2  R2  #5
ADD R3  R3  #5
ADD R4  R4  #15
ADD R4  R4  #1




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

LD  R6  RNG_SEED

STI R6  RNG_SEED2

LD  R2  startMoney

ST  R2  alsoStartMoney

AND R2  R2  #0


LD  R1  len

BR continue
;;----VÆRDIER----;;

playerbet    .STRINGZ    "How many players are betting?"

tempcount   .FILL   #0

playercount .FILL   #0

bet1     .FILL   #0

betnumber1 .FILL #0

bet2     .FILL   #0

betnumber2 .FILL #0

bet3     .FILL   #0

betnumber3 .FILL #0

pseudotal .FILL #0

sekund  .FILL   #500

teller  .FILL   #111

slower  .FILL   #1

slowest .FILL   #1

SSEG   .fill   xFE12

tal     .FILL   #-48

tusind  .FILL   #999

hundrede .FILL  #99

alsoStartMoney  .FILL   #0

btnstr  .STRINGZ "Press button to spin wheel\n"

numbet  .STRINGZ "Which number do you wish to bet on? "

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

speedinc    .FILL   #400

delaycount  .FILL   #600

jump2
BR jump
        
continue


LEA R5  Hjul ;; array[N]+1
LD  R3  len  ;; længde af arr
LD  R6  speedinc ;; increase af delays
AND R4  R4  #0 ;; resetter register R4 til at holde stigende delay værdi

Loop21
LDR R0  R5  #0
STI R0  SSEG

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
        
        
LEA R5  Hjul ;; start forfra i arr til endelige loop
LD  R3  RNG_SEED ;; tallet bliver valgt af RNG seed/modulus af (a*RNG_seed+c)

FinalLoop
LDR R0  R5  #0
STI R0  SSEG

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

BR hop2



;;--WINMULTIPLYER--;;
;; R0 og R2 er reserveret værdier, som holder, henholdsvis hjultal og bet tal.
hop2

LD R1 tempcount


checkwinplayer

ADD R1  R1  #-2
BRZ player2wincon
BRN player1wincon
BRp  player3wincon


player1wincon
LD  R2  betnumber1
BR skipnext



player2wincon
LD  R2  betnumber2
BR skipnext

player3wincon
LD  R2  betnumber3
LD  R5  tempcount
ADD R5  R5  #-1
ST  R5  tempcount


skipnext
NOT R2  R2  

ADD R2  R2  #1

ADD R0  R0  R2
BRz wonbet
BRnp lostbet



wonbet
;; multiply by x factor

multiplyagain

LEA R0  winstr

PUTS

LD  R6  tempcount

ADD R6  R6  #-2
BRZ player2wincon2
BRN player1wincon2
BRp  player3wincon2

player1wincon2
LD  R2  betnumber1
BR skipnext2


player2wincon2
LD  R2  betnumber2
BR skipnext2

player3wincon2
LD  R2  betnumber3
LD  R5  tempcount
ADD R5  R5  #-1
ST  R5  tempcount

LD  R1  twentyone

skipnext2
AND R3  R3  #0
ADD R3  R3  R1
ADD R2  R2  #-1
multiloop
ADD R1  R1  R3
ADD R2  R2  #-1
BRp multiloop
BRnz addscore
;;--ADD CURRENCY TO SCORE--;;
;;Nuværende vigtige register er R1
addscore
LD  R0  alsoStartMoney

ADD R0  R0  R1

STI  R0  alsoStartMoney
ADD R6  R6  #0
BRp multiplyagain
BRnz restart

lostbet

LEA R0  losestr

PUTS

;;--Minus score--;;

LD  R6  tempcount

ADD R6  R6  #-2
BRZ player2wincon3
BRN player1wincon3
BRp  player3wincon3

player1wincon3
LD  R2  betnumber1
BR skipnext3

player2wincon3
LD  R2  betnumber2
BR skipnext3

player3wincon3
LD  R2  betnumber3
LD  R5  tempcount
ADD R5  R5  #-1
ST  R5  tempcount

skipnext3
NOT R1  R1

ADD R1  R1  #1

LD  R0  alsoStartMoney

ADD R0  R0  R1

STI  R0  alsoStartMoney

ADD R5  R5  #0
BRz multiplyagain
BRnz restart




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

LD  R1  tal

ADD R0  R0  R1

ADD R0  R0  #-1
brz jump2
brnp stop



twentyone   .FILL   #21

winstr  .STRINGZ "You win!\n"

losestr .STRINGZ "You lose!\n"

buststr .STRINGZ "You've gone bust! "

repeatbet .STRINGZ "Do you want to bet again? "

yes     .STRINGZ "If yes, press 1! "

no      .STRINGZ "If no, press any other button! "





stop
halt


.end
