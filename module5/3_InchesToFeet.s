#
# Program Name: 3_InchestoFeet.s
# Author: Madeline Gyllenhoff
# Date: October 1, 2023
# Purpose: Take one input in inches and convert it to feet and inches.
# Input: totalInches (int) Inches
# Output: (int) Feet and inches equal to the input
#

.text
.global main

main:
	# Push
	SUB sp, sp, #4
	STR lr, [sp]

	# Read value from the user
	LDR r0, =prompt
	BL printf // Print prompt we want to read
	
	# Set up spot and type of value output by convertion
	LDR r0, =formatString
	LDR r1, =totalInches // Address we want to store total minutes
	BL scanf

	# Do division and save value to new register (r4 in this case)
	LDR r0, =totalInches
	LDR r0, [r0] // Load actual value into r0
	MOV r1, #12 // Value we want to divide r0 by
	BL __aeabi_idiv
	MOV r4, r0 // Save hours in r4 since we will be doing other conversions with r0

	# Multiple r4 by 60 to get minutes covered by hours
	MOV r1, #12
	MOV r0, r4
	MUL r0, r1, r4

	# Subtract minutes caluclated by total minutes
	LDR r1, =totalInches
	LDR r1, [r1]
	SUB r1, r1, r0

	# Print output
	MOV r2, r1 // Move value into r2 to make space for output prompt
	MOV r1, r4 // Need r0 clear to make space for output prompt
	LDR r0, =output
	BL printf

	# Pop
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data
	output: .asciz "\nThis is equal to %d feet and %d inches.\n"
	prompt: .asciz "Enter total inches: "
	totalInches: .word 0 // 32 bit word set to "0" initially
	formatString: .asciz "%d" // Read as integer
