#
# Program Name: celciusToFahrenheit.s
# Author: Madeline Gyllenhoff
# Date: 11/11/2023
# Purpose: To print out celcius converted from fahrenheit using an 
#	external global function
# Functions: Uses CToF for the convertion
# Inputs: Fahrenheit int value
# Outputs: Calcius int value
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
	BL CToF
	MOV r1, r0

	# Print celcius
	LDR r0, =format1
	BL printf

	# Return to the OS
	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	# Prompts the user to enter temperature in celcius
	prompt1: .asciz "Enter the temperature in celcius: "
	#Return prompt to user
	format1: .asciz "\nThe temperature in fahrenheit is %d.\n"
	input1: .asciz "%d"
	num1: .word 0
