.ORIG x0500

AND R0  R0  #0
AND R1  R1  #0
AND R2  R2  #0
AND R3  R3  #0
AND R4  R4  #0
AND R5  R5  #0


ADD R1  R1  #9

LEA R0  Hjul

LDR R0  R0  #0





arrloop
LD R4   sekund ;;værdi 1 til tæller

LD R5   teller ;;værdi 2 til tæller
tellerloop
sekundloop
;;Loop til at køre 10 sekunder

ADD R4  R4  #-1

BRp sekundloop
ADD R5  R5  #-1
BRp tellerloop

STI R0  label
ADD R0  R0  #1
ADD R1  R1  #-1
BRp arrloop

BRZ stop





Hjul    .FILL   x0001
        .FILL   x0002
        .FILL   x0003
        .FILL   x0004
        .FILL   x0005
        .FILL   x0006
        .FILL   x0007
        .FILL   x0008
        .FILL   x0009
        .FILL   x10



sekund  .FILL   #30000

teller  .FILL   #25000

label   .fill   xFE12
stop
halt


.end
