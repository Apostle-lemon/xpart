addi x9,x0,9
addi x9,x9,10
addi x3,x0,114
addi x1,x0,0
sw x9,0(x3)
LOOP:
    addi x1,x1,1
    j LOOP