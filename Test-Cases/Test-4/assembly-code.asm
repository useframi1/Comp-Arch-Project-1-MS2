addi x1, x0, 5 # x1 = 5
addi x2, x0, 10 # x2 = 10
addi x3, x0, -5 # x3 = -5

beq x1, x2, l1 # not taken
add x0, x0, x0 # no-op
l1:
bne x1, x3, l2 # taken
add x0, x0, x0 # no-op
l2:
blt x3, x1, l3 #  taken
add x0, x0, x0 # no-op
l3:
bltu x3, x1, l4 # not taken
add x0, x0, x0 # no-op
l4:
bge x1, x3, l5 # taken
add x0, x0, x0 # no-op
l5:
bgeu x1, x3, l6 # not taken
add x0, x0, x0 # no-op
l6:
