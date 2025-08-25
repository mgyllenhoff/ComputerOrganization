#
# Program Name: 1_FahrenheitToCelcius.s
# Author: Madeline Gyllenhoff
# Date: October 1, 2023
# Purpose: Convert temperature from degree Fahrenheit to Celcius using the formula C = (F - 32) * 5/9.
# Input: F (int) Temperature in Fahrenheit
# Output: (int) Temperature in Celcius
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
	LDR r1, =F
	BL scanf

	# Load value of C into register	
	LDR r0, =F
	LDR r0, [r0]

	# F - 32
	MOV r1, #32
	SUB r0, r0, r1

	# (F - 32) * 5
	MOV r1, #5
	MUL r0, r0, r1

	# ((F - 32) * 5) / 9
	MOV r1, #9
	BL __aeabi_idiv

	# Print output
	MOV r1, r0
	LDR r0, =output
	BL printf

	# Push
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr	

.data
	output: .asciz "\nThe value in Celcius is: %d\n"
	prompt: .asciz "Enter the value in Fahrenheit: "
	F: .word 0
	formatString: .asciz "%d"
