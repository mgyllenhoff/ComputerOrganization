#
# Program Name: inchesToFeet.s
# Author: Madeline Gyllenhoff
# Date: 11/11/2023
# Purpose: To print out feet converted from inches using an 
#	external global function
# Functions: Uses InchesToFeet for the convertion
# Inputs: Inches int value
# Outputs: Feet  int value
#
 
.text
.global main

main:
	#Save return to os on stack
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#Prompt for an input in farenheit
	LDR r0, =prompt1
	BL printf

	# Scanf
	LDR r0, =input1
	SUB sp, sp, #4
	MOV r1, sp
	BL scanf
	LDR r0, [sp, #0]
	ADD sp, sp, #4

	# Convert
	BL InchesToFt
	MOV r1, r0

	# Print celcius
	LDR r0, =format1
	BL printf

	# Return to the OS
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	# Prompts the user to enter inches
	prompt1: .asciz "Enter inches: "
	# Return prompt to the user
	format1: .asciz "\nThis is equal to %d feet.\n"
	input1: .asciz "%d"
	num1: .word 0
