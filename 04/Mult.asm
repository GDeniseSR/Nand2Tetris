// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.


// R2 is where we store the sum


// M[i] = 0
@i
M=0
// M[R2] = 0
@R2
M=0

(LOOP)
// We check if we have finished. We must sum R0 R1 times
// D = M[R1]
@R1
D=M
// D = M[R1] - M[i]
@i
D=D-M
// If M[R1] - M[i] <= 0, jump to END. --> If M[i] >= M[R1], jump to END
@END
D;JLE

// If we haven't finished, we add R0 to R2 once again
// D = M[R0]
@R0
D=M
// M[R2] = D + M[R2]
@R2
M=D+M

// Finally we increment the counter
// M[i] += 1
@i
M=M+1

// And repeat the loop
@LOOP
0;JMP

(END)
@END
0;JMP





