#
# Program Name: findMaxOf3.s
# Author: Madeline Gyllenhoff
# Date: 10/25/2023
# Purpose: Find maximum of three values
# Inputs: Three int vakues
# Functions: findMaxOf3 to compare each of the three values
# Outputs: Int value that is the maximum of the three inputs
#

.global main
main:
    	# Save return to os on stack
    	SUB sp, sp, #4
    	STR lr, [sp, #0]
    
	# Get first number
    	LDR r0, =prompt1
    	BL  printf
    	LDR r0, =input
    	LDR r1, =num
    	BL  scanf
    	LDR r4, =num
    	LDR r4, [r4, #0]
    	
	# Get second number
	LDR r0, =prompt2
	BL printf
	LDR r0, =input
	LDR r1, =num
	BL scanf
	LDR r5, =num
	LDR r5, [r5, #0]

	# Get third number
	LDR r0, =prompt3
	BL printf
	LDR r0, =input
	LDR r1, =num
	BL scanf
	LDR r6, =num
	LDR r6, [r6, #0]

	Bl findMaxOf3

	# Printing the answer
    	MOV r1, r0
    	LDR r0, =formatOutput
   	BL printf

	# Return to the OS
	LDR lr, [sp, #0]
    	ADD sp, sp, #4
   	MOV pc, lr

.data
    	prompt1: .asciz "Enter fist number: "
	prompt2: .asciz "\nEnter second number: "
	prompt3: .asciz "\nEnter third number: "
    	formatOutput:  .asciz "\nThe largest of these three values is: %d\n"
    	input: .asciz "%d"
    	num: .word 0
#end main

.text

#function findMaxOf3
findMaxOf3:
	CMP r4, r5 // if r4 < r5
	MOVLE r4, r5 // then r4 = r5

	CMP r4, r6 // if r4 < r6
	MOVLE r4, r6 // then r4 = r6
	
	MOV r0, r4
	MOV pc, lr
#end findMaxOf3
