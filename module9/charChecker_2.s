#
# Program Name: charChecker_2.s
# Author: Madeline Gyllenhoff
# Date: 10/25/2023
# Purpose: Check if input is a character without logical variables
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
	CMP r1, #0x5A // if r1 > 0x5a
	BGT checkLower

	CMP r1, #0x41 // if r1 >= #0x41
	BGE validCharacter

	B invalidCharacter // If neither then it is an invalid character

	checkLower:
		CMP r1, #0x7A // if r1 >= #0x7A
		BGT invalidCharacter
	
		CMP r1, #0x61 // if r1 > #0x61
		BGE validCharacter
		
		B invalidCharacter // If neither then it is an invalid character

	validCharacter: // Print 1
		MOV r4, #1
		B endCheck

	invalidCharacter: // Print 0
		MOV r4, #0
		B endCheck

	endCheck: 
		# Print output
		MOV r1, r4
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
