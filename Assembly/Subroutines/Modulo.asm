.ORIG x1000

AND R0  R0  #0
AND R1  R1  #0
AND R2  R2  #0
AND R3  R3  #0


LD R1  DIV  

LD R2  MOD

LD R3  MOD  ;COUNTER

;; Først skal vi finde det største tal


NOT R2  R2
ADD R2  R2  #1


ADD R1  R1  R2
BRz found ;hvis lig 0, så er mod lig R1 (er der en fejl her?)

BRn notdiv ; hvis den er negativ kan vi ikke dividere og der er ikke en rest, vores divisor er derfor lig mod

loop
ADD R1  R1  R2
BRp loop
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
ADD R0  R1  #0
BRnzp stop



found
ADD R0  R1  #0
brnzp stop

notdiv
AND R1  R1  #0
LD  R1  DIV
ADD R0  R0  R1
brnzp stop


stop

halt
DIV .FILL #27

MOD .FILL #4

.end
