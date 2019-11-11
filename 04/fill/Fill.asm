// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(LOOPOUTER)
@KBD
D=M
@WHITE
D;JEQ

@i
M=-1
@DRAW
0;JMP

(WHITE)
@i
M=0

(DRAW)
// offset = 256*32 - 1
@8191
D=A
@offset
M=D

(INNERLOOP)
// Calculate address
@SCREEN
D=A
@offset
D=D+M
@addr
M=D

// Get the brush color
@i
D=M

// "Draw" the pixel word with brush
@addr
A=M // *addr
M=D

// offset = offset - 1
@offset
MD = M-1

// If offset < 0, goto LOOPOUTER
@LOOPOUTER
D;JLT

@INNERLOOP
0;JMP