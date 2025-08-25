#
# Program Name: 2_Negate.s
# Author: Madeline Gyllenhoff
# Date: October 1, 2023
# Purpose: Reads an integer number and writes out the negative value of the number using 2's compliment.
# Input: X (int) Value to be negated
# Output: (int) Negated value
#

.text
.global main

main:
	# Pop
	SUB sp, sp, #4
	STR lr, [sp]

	# Read in variable
	LDR r0, =prompt
	BL printf
	LDR r0, =formatString
	LDR r1, =X
	BL scanf

	# Perform negation
	LDR r0, =X
	LDR r0, [r0]


	# Print output	
	MVN r4, r0 // Move the negation of 0, so all r4 bits are 1
	ADD r0, r4, #1 // Put the four lowest level bits (15)
	MOV r1, r0
	LDR r0, =output
	BL printf

	# Push
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Enter the value to be negated: "
	output: .asciz "\nThe negated value is: %d\n"
	X: .word 0
	formatString: .asciz "%d"
