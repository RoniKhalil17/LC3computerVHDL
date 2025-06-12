.orig x3000
JSR createplayer
halt
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
done    ;nå alle spiller er med.
RET
;;halt    ;er ikke done men det er en start
startMoney .fill #300   ;er bare et eksempel på man kan start med penge
tilTal       .fill #-48
player1  .blkw #16  ; indholder 4 til navn, 1 til holde score, 10 til at indholde historik en til null termintor og buffer.
player2  .blkw #16
player3  .blkw #16
.END
