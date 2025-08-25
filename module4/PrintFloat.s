#
# Program Name: PrintFloat.s
# Author: Madeline Gyllenhoff
# Date: 09/21/2023
# Purpose: Read and print out a float
# Inputs: Float value
# Outputs: Float value
#

.text
.global main

main:
	# Save return to os on stack 
	sub sp, sp, #4
	str lr, [sp, #0]

	# Prompt For An Input
	ldr r0, =prompt1
	bl printf

	# Scanf
	ldr r0, =input1 
	ldr r1, =num1
	bl scanf

	# Printing The Message
	ldr r0, =format1
	ldr r1, =num1
	ldr r1, [r1]
	vmov s0, r1
	vcvt.f64.f32 d0, s0
	ldr r0, =format2
	vmov r1, r2, d0
	bl printf

	# Return to the OS
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

.data
	num1: .word 0
	prompt1: .asciz "Enter A Number: "
	input1: .asciz "%f"
	format1: .asciz "\nYour Number Is %f \n"
	format2: .asciz "%.2f\n"

