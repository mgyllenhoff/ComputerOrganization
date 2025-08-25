#
# Program Name: ExtraCredit_Swap.s
# Author: Madeline Gyllenhoff
# Date: October 1, 2023
# Purpose: Uses xor operations (eor) to swap two variables without using additional registers.
# Input: Value (int) Value to be swapped with the second value
# Input: Value (int) Value to be swapped with the first value
# Output: (int) Second input in the spot of the first input
# Output: (int) First input in the spot of the second input
#

.text
.global main

main:
	# Pop
	SUB sp, sp, #4
	STR lr, [sp]

	# Read first value
	LDR r0, =prompt1
	BL printf // Print prompt we want to read
	LDR r0, =formatString
	LDR r1, =Value // Address we want to store total minutes
	BL scanf
	LDR r4, =Value
	LDR r4, [r4]

	# Read second value
	LDR r0, =prompt2
	BL printf
	LDR r0, =formatString
	LDR r1, =Value
	BL scanf
	LDR r5, =Value
	LDR r5, [r5]

	# Swap
	eor r4, r4, r5
	eor r5, r4, r5
	eor r4, r4, r5

	# Print output
	MOV r1, r4
	MOV r2, r5
	LDR r0, =output
	BL printf

	# Push
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt1: .asciz "Enter first value: "
	prompt2: .asciz "Enter second value: "
	Value: .word 0
	formatString: .asciz "%d" // Read as integer
	output: .asciz "\nFirst value is now %d and second value is now %d.\n"
