#
# Program Name: charChecker_1.s
# Author: Madeline Gyllenhoff
# Date: 10/25/2023
# Purpose: Check if input is a character with logical variables
# Inputs: Char value
# Outputs: Boolean value (0 = No it is not a character, 1 = Yes it is a character)
#

.text
.global main

main:
	# Push
	SUB sp, sp, #4
	STR lr, [sp]

	# Get input
	LDR r0, =prompt
	BL printf
	LDR r0, =format
	LDR r1, =val
	BL scanf
	LDR r1, =val
	LDR r1, [r1, #0]

	# From lecture
	MOV r2, #0 // All bits are 0
	CMP r1, #0x41 // if r1 >= 0x41
	ADDGE r2, #1 // then add 1 to r2

	MOV r3, #0
	CMP r1, #0x5A // if r1 < 0x5a
	ADDLE r3, #1 // then add 1 to r3
	AND r2, r2, r3 // Results from first AND, if true r1 is uppercase

	MOV r0, #0
	CMP r1, #0x61 // if r1 >= 0x61
	ADDGE r0, #1 // then add 1 to r0

	MOV r3, #0
	CMP r1, #0x7A // if r1 < 0x7A
	ADDLE r3, #1 // add 1 to r3
	AND r3, r3, r0 // Results from second AND, if true r1 is lowercase
	ORR r2, r2, r3 // If upper or lowercase, then r2 is true

	# Print output
	MOV r1, r2
	LDR r0, =output
	BL printf

	# Push
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Enter value: "
	output: .asciz "\nIs it a character? %d (0=No, 1=Yes)\n"
	val: .word 0
	format: .asciz "%c"
