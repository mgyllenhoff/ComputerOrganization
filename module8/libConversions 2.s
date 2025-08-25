#
# Program Name: libConversions.s
# Author: Madeline Gyllenhoff
# Date: 11/11/2023
# Purpose: Library of functions used as convertions for other files
# Functions: 
# 	Miles2Kilometers: Converts miles to kilometers
#	kph: Converts miles and hours into kilometers per hour
#	CToF: Converts celcius to fahrenheit
#	InchesToFt: Converts inches to feet
# Inputs: kph takes in hours int value
#

.global Miles2Kilometers
.global kph
.global CToF
.global InchesToFt

.text
Miles2Kilometers:
	# push stack
	SUB sp, sp, #4
	STR lr, [sp]

	# Convert miles to kimometers
	/* 
	1 mile ~= 1600 meters
	1 meter = 1/1000 kilometers
	Therefore, 1 mile = 1600/1000 kilometers,
	which simplifies to 1 mile = 16/10 kilometers.
	So we can muliply mile by 16 and divide by 10 
	to get equivalent in kilometers.
	*/
	# Multiply by 16
	MOV r1, #16
	MUL r0, r0, r1
	
	# Divide by 10
	MOV r1, #10
	BL __aeabi_idiv

	# pop stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data
#END Miles2Kilometers


.text
kph:
	# push stack
	SUB sp, sp, #8
	STR lr, [sp, #0]
	STR r4, [sp, #4]

	# Convert miles to kimometers
	BL Miles2Kilometers
	
	# Prompt for hours
	MOV r4, r0
	LDR r0, =prompt
	BL printf
	LDR r0, =inputFormat
	LDR r1, = inputNum
	BL scanf
	LDR r1, =inputNum
	LDR r0, [r1, #0]

	# Divide kilometers by hours
	MOV r1, r0
	MOV r0, r4
	BL __aeabi_idiv

	# Push
	LDR r4, [sp, #4]
	LDR lr, [sp, #0]
	ADD sp, sp, #8
	MOV pc, lr

.data
	inputNum: .word 0
	# Prompts the user to enter hours
	prompt: .asciz "Enter hours: "
	inputFormat: .asciz "%d"
#END kph


.text
CToF:
	# push stack
	SUB sp, sp, #4
	STR lr, [sp]

	# Convert to fahrenheit (r0 = (r0 * 9 / 5) + 32)
	# Multiply by 9
	MOV r1, #9
	MUL r0, r0, r1
	
	# Divide by 5
	MOV r1, #5
	BL __aeabi_idiv

	# Add 32
	MOV r1, #32
	ADD r0, r0, r1

	# pop stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data
#END CToF


.text
InchesToFt:
	# push stack to store linked register in a safe space
	SUB sp, sp, #4
	STR lr, [sp]	

	# Convert to feet (r0 = r0 / 12)
	# Divide by 12
	MOV r1, #12
	BL __aeabi_idiv

	# pop stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data
#END InchesToFt

