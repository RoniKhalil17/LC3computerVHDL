.orig x0500

newgame

AND R0  R0  #0

ST  R0  bet

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

add r1, r1, #12 ; næste array
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
player1  .blkw #16  ; indholder 4 til navn, 1 til holde score, 10 til at indholde historik en til null termintor og buffer.
player2  .blkw #16
player3  .blkw #16

;;PseudoRandom 
done
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
LD  R1  looppseudotal
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

;; min ide til hvordan vi gør det "random" er at jeg vil tage random tallet og også gøre det til en counter, som styrer loopet. Ellers hvis loopet konstant er 10
;; så kommer tallene til at føles meget predictable, samtidig har vi stadig lidt et problem, hvis man kører spillet mere end en gang, men måske kan vi fikse det ved at gøre
; værdierne a, X, c og M til et tal vi vælger inden spil start?
hop1
ST  R5  looppseudotal
ST  R5  pseudotal
;;----BET----;;

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

;;LD  R1  startMoney

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



ST  R0  bet

;;Hvilket tal vil du bette på?
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

ST  R0  betnumber

AND R2  R2  #0

ADD R2  R1  #0

;;----Button----;;
;;R5 er reserveret indtil efter wheel er kørt

inputloop
AND R0  R0  #0
AND R1  R1  #0
AND R3  R3  #0
AND R4  R4  #0
AND R6  R6  #0

LEA R0  btnstr

PUTS

AND R0  R0  #0

IN

LD  R1  tal

ADD R0  R0  R1

ADD R0  R0  #-1
brz click

brnp inputloop



;;Wheel Subroutine

click
AND R0  R0  #0
AND R1  R1  #0
AND R2  R2  #0
AND R3  R3  #0
AND R4  R4  #0
AND R6  R6  #0

LD  R2  startMoney

ST  R2  alsoStartMoney

AND R2  R2  #0


LD  R1  len

BR continue
;;----VÆRDIER----;;

looppseudotal .FILL #3

pseudotal .FILL #0

sekund  .FILL   #1000

teller  .FILL   #1111

slower  .FILL   #2000

slowest .FILL   #4000

label   .fill   xFE12

tal     .FILL   #-48

bet     .FILL   #0

betnumber .FILL #0

tusind  .FILL   #999

hundrede .FILL  #99

alsoStartMoney  .FILL   #0

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
        .FILL   X0010
        .FILL   X0011
        .FILL   X0012 ;; 18
        .FILL   X0013
        .FILL   X0014
        .FILL   X0015
        
len     .FILL   #21
        
        
continue


LEA R0  Hjul

LDR R0  R0  #0





arrloop
LD R6   teller ;;værdi 2 til tæller
tellerloop

LD R4   sekund ;;værdi 1 til tæller

tickloop
;;Loop til at køre 10 sekunder

ADD R4  R4  #-1
BRp tickloop
ADD R6  R6  #-1
BRp tellerloop

STI R0  label
ADD R0  R0  #1
ADD R1  R1  #-1
BRp arrloop
BR nextloop



nextloop
LEA R0  Hjul

LDR R0  R0  #0
LD  R1  len


;;--Langsommere loop--;;

wheelloop2
LD  R6  teller
tloop2
LD  R4  slower
tloop3
ADD R4  R4  #-1
brp tloop3
ADD R6  R6  #-1
brp tloop2


STI R0  label
ADD R0  R0  #1
ADD R1  R1  #-1
BRp wheelloop2
BR nextloop2


nextloop2
;;--Langsommest loop--;;
LD  R1  pseudotal

LEA R0  Hjul

LDR R0  R0  #0
wheelloop3
LD  R6  teller
tloop4
LD  R4  slowest
tloop5
ADD R4  R4  #-1
brp tloop5
ADD R6  R6  #-1
brp tloop4


STI R0  label
ADD R0  R0  #1
ADD R1  R1  #-1
BRp wheelloop3
BR hop2


;;--WINMULTIPLYER--;;
;; R0 og R2 er reserveret værdier, som holder, henholdsvis hjultal og bet tal.
hop2
ADD R0  R0  #-1

LD  R2  betnumber

NOT R2  R2  

ADD R2  R2  #1

ADD R0  R0  R2
BRz wonbet
BRnp lostbet



wonbet
;; multiply by x factor
LEA R0  winstr

PUTS

LD  R1  bet

LD  R2  betnumber

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
BR restart

lostbet

LEA R0  losestr

PUTS

;;--Minus score--;;

LD  R1  bet

NOT R1  R1

ADD R1  R1  #1

LD  R0  alsoStartMoney

ADD R0  R0  R1

STI  R0  alsoStartMoney

BR restart




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
brz jump
brnp stop



betstr  .STRINGZ "How much do you wish to bet? "

numbet  .STRINGZ "Which number do you wish to bet on? "

btnstr  .STRINGZ "Press 1 to spin wheel "

winstr  .STRINGZ "You win!\n"

losestr .STRINGZ "You lose! "

buststr .STRINGZ "You've gone bust! "

repeatbet .STRINGZ "Do you want to bet again? "

yes     .STRINGZ "If yes, press 1! "

no      .STRINGZ "If no, press any other button! "




stop
halt


.end
