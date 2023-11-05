addi x17, x0, 1 # x17 = 1
jal x3, l1 # x3=8 ; Pc=20
ecall # no-op
fence 1, 1# no-op
ebreak # Pc stays same at 16
l1:
addi x1, x0, -5 # x1 = -5
srai x2, x1, 2 # x2 = -2
jalr x0, x3, 0 # PC = 8
