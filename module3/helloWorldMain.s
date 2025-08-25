#
# Program name: helloWorldMain.s
# Author: Charles Kann
# Date:9/19/2020
# Purpose: This program shows how to print a string using the C function printf #
.text
.global main
main:
    # Save return to os on stack SUB sp, sp, #4
    STR lr, [sp, #0]
    # Printing The Message LDR r0, =helloWorld BL printf
    # Return to the OS LDR lr, [sp, #0] ADD sp, sp, #4 MOV pc, lr
.data
# Stores the string to be printed helloWorld: .asciz "Hello World\n"