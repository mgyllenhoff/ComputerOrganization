#
# Program Name: prime.s
# Author: Madeline Gyllenhoff
# Date: 11/5/2023
# Purpose: Determine if number is prime
# Inputs: 
#	-1 to end program
#	Int value larger than 2
# Outputs:
#	Whether the number is prime or not 
# Dictionary:
#	r4 - number that should be checked if it is prime
#	r5 - counter for prime loop (start at 2)
#	r6 - limit for prime loop (end at n/2+1)
#	r7 - remainder of mod
#

.text
.global main

main:
	# Note: seninel loop input (to -1) is kept in regist r0 as its value is short lived

	# Push stack
	SUB sp, sp, #12
	STR lr, [sp, #0]
	STR r4, [sp, #4]
	STR r5, [sp, #8]
	STR r6, [sp, #12]

	# Program goes here
	# Initialize the loop
	LDR r0, =promptCont // Print prompt to continue the loop
	BL printf
	LDR r0, =decFormat // Read in the value as a decimal format
	LDR r1, =continue // Read it into the value continue
	BL scanf
	
	startSentinelLoop: // Add endSentinelLoop when this is created
		LDR r1, =continue // r1 never contained the value, it contained an address and that address may have been changed. The value is at the memeory location continue, so load that memory location
		LDR r1, [r1] // Then load r1, the value, into that address
		CMP r1, #-1 // If user enters -1...
		BEQ endSentinelLoop // ...then branch to end

		# Block or statement for sentinel loop
		# Ask for/Read value
		ldr R0, =promptNumber
		BL printf
		LDR r0, =decFormat
		LDR r1, =number
		BL scanf
		LDR r4, =number
		LDR r4, [r4]

		# Check if value is valid
		CMP r4, #2
		BLE errorCheck	

		# Determine if number is prime
		MOV r5, #2 // Initialize loop counter to 2
		
		MOV r0, r4 // Initialize loop counter upper limit
		MOV r1, #2
		BL __aeabi_idiv
		ADD r6, r0, #1
		
		primeLoop:
			CMP r5, r6 // If we reach the upper limit of the loop...
			BGE isPrime //...then it is a prime number

			MOV r0, r4 // r7 = r4 - int(r4/r5)*r5
			MOV r1, r5
			BL __aeabi_idiv
			MUL r7, r0, r5
			SUB r7, r4, r7
			
			CMP r7, #0
			BEQ isNonPrime
			
			ADD r5, r5, #1
			B primeLoop

		isPrime:
			# Print the number
			MOV r1, r4
			LDR r0, =primeOutput
			BL printf
			B getNextValue

		isNonPrime:
			MOV r1, r4
			LDR r0, =nonPrimeOutput
			BL printf
			B getNextValue

		# Return error message if value is not greater than 2
		errorCheck:
			LDR r0, =error
			BL printf
			B getNextValue

		# Get the next value
		getNextValue:
			LDR r0, =promptCont
			BL printf
			LDR r0, =decFormat
			LDR r1, =continue
			BL scanf
			B startSentinelLoop

	endSentinelLoop:

	# Pop stack
	LDR lr, [sp, #0]
	LDR r4, [sp, #4]
	LDR r5, [sp, #8]
	LDR r6, [sp, #12]
	ADD sp, sp, #12
	MOV pc, lr

.data
	promptCont:	.asciz "\nEnter -1 to end the program, any other key to continue: "
	promptNumber:	.asciz "\nPlease enter an integer number to check if it is prime: "
	error:		.asciz "\nThe value must be greater than 2"
	decFormat:	.asciz "%d"
	number:		.word 0
	continue:	.word 0
	primeOutput:	.asciz "\n%d is a prime number\n"
	nonPrimeOutput:	.asciz "\n%d is not a prime number\n"
