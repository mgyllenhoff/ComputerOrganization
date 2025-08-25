#
# Program Name: 3_FeetToInches.s
# Author: Madeline Gyllenhoff
# Date: October 1, 2023
# Purpose: Take two input numbers that represent feet and inches and convert this answer to be just inches.
# Input: totalFeet (int) Feet
# Input: totalInches (int) Inches
# Output: (int) Combination of inputs in only inches
#

.text
.global main

main:
	# Pop
	SUB sp, sp, #4
	STR lr, [sp]

	# Read feet value from the user
	LDR r0, =prompt1
	BL printf // Print prompt we want to read
	LDR r0, =formatString
	LDR r1, =totalFeet // Address we want to store total minutes
	BL scanf
	LDR r4, =totalFeet
	LDR r4, [r4]

	# Read inches value from the user
	LDR r0, =prompt2
	BL printf
	LDR r0, =formatString
	LDR r1, =totalInches
	BL scanf
	LDR r0, =totalInches
	LDR r0, [r0]

	# Computation
	MOV r5, #12
	MUL r4, r4, r5
	ADD r0, r0, r4

	# Print output
	MOV r1, r0
	LDR r0, =output
	BL printf

	# Push
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt1: .asciz "Enter total feet: "
	prompt2: .asciz "Enter total inches: "
	totalFeet: .word 0 // 32 bit word set to "0" initially
	totalInches: .word 0
	formatString: .asciz "%d" // Read as integer
	output: .asciz "\nThis is equal to %d inches.\n"
