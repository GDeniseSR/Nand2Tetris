// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

@i
M=-1

(LOOP)
@KBD
D=M

@BLACKEN
D;JEQ

// Whiten
// If i >= 0, decrease
@i
D=M

@DECR
D;JGE

// Else go back
@LOOP
0;JMP

(DECR)
@i
D=M

// Address to the group of 16 pixels we are at
@SCREEN
A=D+A

// We set that addres to 0 (white it)
M=0

// We decrease i to move from that group
@i
M=M-1

@LOOP
0;JMP


(BLACKEN)
// If i < 8192, increase
@i
D=M

// Total number of groups of 16 pixels - 1
@8191
D=D-A

// If i - 8192 < 0
@INCR
D;JLT
// Else go back
@LOOP
0;JMP


(INCR)
// We move to the next group
@i
M=M+1

D=M

// Address to the group of 16 pixels we are at
@SCREEN
A=D+A

// We blacken that group of 16 pixels setting it to -1
M=-1

@LOOP
0;JMP






