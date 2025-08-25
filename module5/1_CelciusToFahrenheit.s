#
# Program Name: 1_CelciusToFahrenheit.s
# Author: Madeline Gyllenhoff
# Date: October 1, 2023
# Purpose: Convert temperature from degree Celsius to Fahrenheit using the formula F = (C * 9/5) + 32.
# Input: C (int) Temperature in Celcius
# Output: (int) Temperature in Fahrenheit
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
	LDR r1, =C
	BL scanf

	# Load value of C into register	
	LDR r0, =C 
	LDR r0, [r0]

	# C * 9
	MOV r1, #9
	MUL r0, r0, r1

	# (C * 9) / 5
	MOV r1, #5
	BL __aeabi_idiv

	# (C * 9 / 5) + 32
	MOV r1, #32
	ADD r0, r0, r1

	# Print output
	MOV r1, r0
	LDR r0, =output
	BL printf

	# Push
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr	

.data
	output: .asciz "\nThe value in Fahrenheit is: %d\n"
	prompt: .asciz "Enter the value in Celcius: "
	C: .word 0
	formatString: .asciz "%d"
