#
# Program Name: grader.s
# Author: Madeline Gyllenhoff
# Date: 10/25/2023
# Purpose: Return letter grade of student based on number grade
# Inputs: Name of student and number grade
# Outputs: Name of student and letter grade
#

.text
.global main
main:
	# Save return to os on stack
    	SUB sp, sp, #4
    	STR lr, [sp, #0]

	# Read input (name)
	LDR r0, =prompt1
	BL printf
	LDR r0, =input1
	LDR r1, =name1
	BL scanf

	# Read input (grade)
	LDR r0, =prompt2
	BL printf
	LDR r0, =format2
	LDR r1, =input2
	BL scanf
	LDR r4, =input2
	LDR r4, [r4]

	LDR r0, =format1
	LDR r1, =name1
	BL printf
	
	# Check that 0 <= r4 <= 100
    	MOV r1, #0
    	MOV r0, #0
    	CMP r4, r0
    	MOVGE r1, #1
    	
	MOV r2, #0
    	MOV r0, #100
    	CMP r4, r0
    	MOVLE r2, #1
    	
	AND r1, r1, r2
    	MOV r2, #1
    	CMP r1, r2
    	BEQ grade_A
    	
	# Code block for Invalid Grade
    	LDR r0, =Invalid
    	BL printf
    	B EndIf
 
   	grade_A:
    		MOV r0, #90
    		CMP r4, r0
    		BLT grade_B

    	# Code block for grade of A
    	LDR r0, =GradeA
    	BL printf
    	B EndIf

    	grade_B:
    		MOV r0, #80
    		CMP r4, r0
    		BLT grade_C

    	# Code block for grade of B
    	LDR r0, =GradeB
    	BL printf
    	B EndIf

    	grade_C:
    		MOV r0, #70
    		CMP r4, r0
    		BLT grade_D

    	# Code block for grade of C
    	LDR r0, =GradeC
    	BL printf
    	B EndIf
 
   	grade_D:
    		MOV r0, #60
    		CMP r4, r0
    		BLT Else

    	# Code block for grade of D
    	LDR r0, =GradeD
    	BL printf
    	B EndIf
    	
	Else:
    		# Code block for grade of F
    		LDR r0, =GradeF
    		BL printf
    		B EndIf

EndIf:
	# Return to the OS
    	ldr lr, [sp, #0]
    	add sp, sp, #4
    	mov pc, lr

.data
    	GradeA: .asciz "A\n"
    	GradeB: .asciz "B\n"
    	GradeC: .asciz "C\n"
    	GradeD: .asciz "D\n"
    	GradeF: .asciz "F\n"
    	Invalid: .asciz "Grade must be 0 <= grade <= 100\n"
	prompt1: .asciz "Enter name: "
	prompt2: .asciz "Enter grade: "
	input1: .asciz "%s"
	input2: .word 0
	format1: .asciz "\n%s's grade is: "
	format2: .asciz "%d"
	name1: .space 40
