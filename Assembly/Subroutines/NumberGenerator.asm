.ORIG x1000
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
ADD R1  R1  #3
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
BRnzp stop



found
ADD R5  R1  #0
brnzp stop

notdiv
AND R1  R1  #0
ADD R1  R1  R0
ADD R5  R5  R1
brnzp stop


stop

halt
;DIV .FILL #27

;MOD .FILL #4

;; min ide til hvordan vi gør det "random" er at jeg vil tage random tallet og også gøre det til en counter, som styrer loopet. Ellers hvis loopet konstant er 10
;; så kommer tallene til at føles meget predictable, samtidig har vi stadig lidt et problem, hvis man kører spillet mere end en gang, men måske kan vi fikse det ved at gøre
; værdierne a, X, c og M til et tal vi vælger inden spil start?

.end
