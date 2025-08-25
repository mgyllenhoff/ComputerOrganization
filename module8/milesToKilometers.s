#
# Program Name: milesToKilometers.s
# Author: Madeline Gyllenhoff
# Date: 11/11/2023
# Purpose: To print out kilometers converted from miles using an 
#	external global function
# Functions: Uses Miles2Kilometers for the convertion
# Inputs: Miles int value
# Outputs: Kilometers int value
#

.text
.global main

main:
	# Push
	sub sp, sp, #4
	str lr, [sp, #0]

	# Prompt for input (miles)
	ldr r0, =prompt1
	bl printf
	ldr r0, =input1
	sub sp, sp, #4
	mov r1, sp
	bl scanf
	ldr r0, [sp, #0]
	add sp, sp, #4

	# Convert miles to kilometers
	bl Miles2Kilometers
	mov r1, r0

	# Return kilometers
	ldr r0, =format1
	bl printf

	#Pop
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

.data
	# Prompts the user to enter miles
	prompt1: .asciz "Enter the length in miles you want in kilometers: "
	# Prompt returned to the user
	format1: .asciz "\nThe length in kilometers is: %d\n"
	input1: .asciz "%d"
	num1: .word 0
