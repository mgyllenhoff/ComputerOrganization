#
# Program Name: 4_Times10.s
# Author: Madeline Gyllenhoff
# Date: October 1, 2023
# Purpose: Read an input number and using left logical shifts and add instructions multiply that number by 10 and print out the result.
# Input: X (int) Number to be multiplied by 10.
# Output: (int) Number multiplied by 10.
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

	# Load register and perform calculation
	LDR r0, =X
	LDR r0, [r0]
	LSL r4, r0, #3
	LSL r5, r0, #1
	ADD r2, r4, r5

	# Print output
	MOV r1, r0
	LDR r0, =output
	BL printf
	
	# Push
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr	

.data
	prompt: .asciz "Enter value to be multiplied by 10: "
	output: .asciz "\n%d * 10 = %d\n"
	X: .word 0
	formatString: .asciz "%d"
