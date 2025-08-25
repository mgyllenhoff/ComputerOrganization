#
# Program Name: multiplication.s
# Author: Madeline Gyllenhoff
# Date: 11/12/2023
# Purpose: Multiply two values together by using recursion
# Inputs: 
#	First int value in equation
#	Second int value in equation
# Outputs:
#	Product of the two input values
# Dictionary:
#	r4 - Spot to save the output value so it is not messed up in recursive calls
#	r5 - First value to be multiplied
#	r6 - Second value to be multiplied
#

.text
.global main

main:
	# Save return to os on stack
	sub sp, sp, #4 
	str lr, [sp, #0]

	LDR r0, =prompt
	BL printf
	LDR r0, =format
	LDR r1, =number
	BL scanf
	LDR r5, =number
	LDR r5, [r5]

	LDR r0, =prompt2
	BL printf
	LDR r0, =format
	LDR r1, =number
	BL scanf
	LDR r6, =number
	LDR r6, [r6]

	mov r0, r5
	mov r5, #0 
	bl Summation 
	mov r1, r0
	ldr r0, =output 
	bl printf

	# Return to the OS 
	ldr lr, [sp, #0] 
	add sp, sp, #4 
	mov pc, lr

.data
	prompt: .asciz "\nEnter first number: "
	prompt2: .asciz "\nEnter second number: "
	output: .asciz "\nSum of these two numbers is %d\n"
	format: .asciz "%d"
	number: .word 0


.text
	Summation:
		# push stack. Save r0 (summation) in r10, so r10 has to be saved by callee convention 
		sub sp, sp, #8
		str lr, [sp, #0]
		str r4, [sp, #4] 

		mov r4, r0

		# if r0 is 0, return 0
		cmp r4, #0
		beq return // return 0 in r0

		add r0, r4, #-1
		bl Summation // return value in r0 
		add r0, r4, r0 // return summation in r0 
		add r5, r5, r6
		b return // not really needed

		# pop stack and return 
		return:
			mov r0, r5
			ldr lr, [sp, #0] 
			ldr r4, [sp, #4] 
			add sp, sp, #8 
			mov pc, lr
	#END Summation
