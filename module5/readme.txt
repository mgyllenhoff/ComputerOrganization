
Author: Madeline Gyllenhoff
Date: October 1, 2023
Version: 1
Purpose: Answering questions presented in the Module 5 Assignment to practice writing basic ARM Assembly programs.
To Run: Enter file that all programs are within. Call "make" (this has already been done). Call program by using "./" followed by the program name, ex. "./1_CelciusToFahrenheit".


Files Include:
1_CelciusToFahrenheit.s
1_CelciusToFahrenheit.o
1_CelciusToFahrenheit
1_FahrenheitToCelcius.s
1_FahrenheitToCelcius.o
1_FahrenheitToCelcius

2_Negate.s
2_Negate.o
2_Negate

3_FeetToInches.s
3_FeetToInches.o
3_FeetToInches
3_InchesToFeet.s
3_InchesToFeet.o
3_InchesToFeet

4_Times10.s
4_Times10.o
4_Times10

ExtraCredit_Swap.s
ExtraCredit_Swap.o
ExtraCredit_Swap


Purpose of Above Files:
The first group implements two programs, one to convert temperature from degree Celsius to Fahrenheit, and one to do  Fahrenheit to Celsius.  The formulas for this are: F = (C * 9/5) + 32 and C = (F - 32) * 5/9. 

The second group implement a program that reads an integer number and writes out the negative value of the number using 2's compliment.

The third group implements two programs, one to read two input numbers that represent feet and inches and convert this answer to be just inches and the other to do the reverse, taking one input in inches and convert it to feet and inches.

The fourth group implements a program that reads an input number and, using left logical shifts and add instructions, multiplies that number by 10 and print out the result.

The fifth group, which is teh extra credit question, implements a program to swap two registers using eor instructions so that additional registers are not created.
