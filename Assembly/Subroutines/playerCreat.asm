.orig x3000
LEA R1, player1 ;loader adressen til arrayet ind
and r2, r2, #0 ; sikker at den er nul
add r2, r2, #3  ;player navn bliver max på 3 bogstaver
loop        ; loop
getc        ;til at få bogstav
str r0, r1, #0  ; gemmer bogstavet
add r1, r1, #1  ;rykker en plads
add r2, r2, #-1 ;-1 så man kommer ud af loopet på det rigtige tidspunkt.
brnp loop   ;loop
halt    ;er ikke done men det er en start
player1  .blkw #3 
.end
