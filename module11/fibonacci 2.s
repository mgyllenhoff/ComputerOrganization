#
# Program Name: fibonacci.s
# Author: Madeline Gyllenhoff
# Date: 11/12/2023
# Purpose: Print Fibonacci number from the sequency corresponding to input number
# Inputs: 
#	Int value (positive)
# Outputs:
#	Number from Fibonacci sequence
# Dictionary:
#	r4 - half of loop used to find Fibonacci number
#	r5 - other half of loop to find Fibonacci number
#

.text
.global main

main:
	# Pop
	SUB sp, sp, #4
	STR lr, [sp]

	# Prompt for number
	LDR r0, =prompt
	BL printf
	LDR r0, =format
	LDR r1, =number
	BL scanf
	
	# Save number to r0 and call fibonacci recursive function
	LDR r0, =number
	LDR r0, [r0]
	CMP r0, #0
	BEQ end
	SUB r0, r0, #1
	BL fibonacci
	
	end:
	# Print output
	MOV r1, r0 // Save fibonacci result to r1 so we can save prompt to r0
	LDR r0, =output
	BL printf

	# Push
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "\nEnter value to find Fibonacci number: "
	output: .asciz "\nFibonacci number is: %d\n"
	format: .asciz "%d"
	number: .word 0
#END main

.text
fibonacci:
	# Make space for registers (we will be using r4 and r5)
	SUB sp, sp, #12
	STR lr, [sp]
	STR r4, [sp, #4]
	STR r5, [sp, #8]

	# If r0 == 0, return n
	firstIf:
		CMP r0, #0
		BNE secondIf
		MOV r0, #1
		B return

	# If r0 == 1, return n
	secondIf:
		CMP r0, #1
		BEQ return

	# Else, return fibonacci(r0 - 1) + fibonacci(r0 - 2)
	else:
		MOV r4, r0
		SUB r0, r0, #1 // r0 - 1
		BL fibonacci
		MOV r5, r0
		SUB r0, r4, #2 // r0 - 2
		BL fibonacci
		ADD r0, r0, r5 // Add results

	return:
		LDR lr, [sp]
		LDR r4, [sp, #4]
		LDR r5, [sp, #8]
		ADD sp, sp, #12
		MOV pc, lr

.data
#END fibonacci
