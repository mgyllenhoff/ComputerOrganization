#
# Program Name: MakeFile
# Author: Madeline Gyllenhoff
# Date: 11/11/2023
# Purpose: Takes .s files and makes .o and main files
# Inputs: 
# 	milesToKilometers.s
# 	mphToKph.s
# 	celciusToFahrenheit.s
# 	inchesToFeet.s
# Outputs:
# 	milesToKilometers.o
# 	mphToKph.o
# 	celciusToFahrenheit.o
# 	inchesToFeet.o
#	milesToKilometers
# 	mphToKph
# 	celciusToFahrenheit
# 	inchesToFeet
# 

All: milesToKilometers mphToKph celciusToFahrenheit inchesToFeet
LIB=libConversions.o
CC=gcc

milesToKilometers: milesToKilometers.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

mphToKph: mphToKph.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

celciusToFahrenheit: celciusToFahrenheit.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

inchesToFeet: inchesToFeet.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@
.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
