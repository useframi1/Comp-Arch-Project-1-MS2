addi x1, x0, 5 # x1 = 5
addi x2, x0, 10 # x2 = 10
addi x3, x0, -2 # x3 = -2
addi x8, x1, -2 # x8 = 3
sw x1, 0(x0) # mem[0:3] = 5
sb x2, 1(x0) # mem [0] = 5; mem[1:3] = 10
sh x3, 2(x0) # mem[0] = 5; mem[1] = 10; mem[2:3] = -2
lhu x4, 2(x0) # x4 = 65534
lbu x5, 2(x0) # x5 = 254
lh  x6, 2(x0) # x6 = -2
lb  x7, 2(x0) # x7 = -2