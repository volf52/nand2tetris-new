// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// sum = 0
@sum
M=0

// i = R1
@R1
D=M
@i
M=D

(LOOP)
@i
D=M
@STORE
D;JEQ

// sum = sum + R0
@R0
D=M
@sum
M=D+M

// i--
@i
MD=M-1

@LOOP
0;JMP

(STORE)
@sum
D=M
@R2
M=D

(END)
@END
0;JMP