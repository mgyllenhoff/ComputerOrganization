#
# Program Name: mphToKph.s
# Author: Madeline Gyllenhoff
# Date: 11/11/2023
# Purpose: To print out kilometers per hour converted from miles and hours 
# 	using an external global function
# Functions: Uses kph for the convertion
# Inputs: Miles and hours as int values
# Outputs: Kilometers per hour int value
#

.text
.global main
main:
	# Pop
    	SUB sp, sp, #4
    	STR lr, [sp, #0]

	# Prompt for  miles
	LDR r0, = prompt1
	BL printf
	LDR r0, =input1
	LDR r1, =num1
	BL scanf
	LDR r0, =num1
	LDR r0, [r0]

	# Call function 
	BL kph

	# Print
    	MOV r1, r0
   	LDR r0, =output
    	BL printf
    	MOV r0, #0

	# Push
    	LDR lr, [sp, #0]
    	ADD sp, sp, #4
    	MOV pc, lr

.data
	# Prompts the user to enter miles
	prompt1: .asciz "Enter miles: "
	# Prompt returned to user
	output: .asciz "This is equal to %d kilometers per hours.\n"
	input1: .asciz "%d"
	num1: .word 0

