# Blake Whitaker
# Project 1 part A

.data
prompt: .asciiz "Enter 4 integers for A, B, C, D respectively:\n"
newLine: .asciiz "\n"
decimal: .asciiz "f_ten = "
binary: .asciiz "f_two = "
decimal2: .asciiz "g_ten = " 
binary2: .asciiz "g_two = "
.text

main:
li $v0, 4		# Display prompt
la $a0, prompt
syscall

li $v0, 5		# Read A input in $v0 and store in $t0.
syscall
move $t0, $v0

li $v0, 5		# Read B input in $v0 and store in $t1.
syscall
move $t1, $v0

li $v0, 5 		# Read C input in $v0 and store in $t2.
syscall
move $t2, $v0

li $v0, 5 		# Read D input in $v0 and store in $t3
syscall
move $t3, $v0

li $t6, 0		# A^4 Loop
L1:
bge $t6, $t0, quit
add $s1, $s1, $t0	
addi $t6, $t6, 1
j L1

quit:
li $t6, 0		# Loop (A^2 x A^2)
L1A:
bge $t6, $s1, quit1A
add $s5, $s5, $s1
addi $t6, $t6, 1
j L1A			# End of loop

quit1A:			# Loop for 4 x A^3
li $t6,0
L2:
bge $t6, 4, quit2
add $s2, $s2, $t1
addi $t6, $t6, 1
j L2			# End of loop

quit2:			# Loop for B x B
li $t6, 0
L2A:
bge $t6, $t1, quit2A
add $s6, $s6, $t1
addi $t6, $t6, 1
j L2A			# End of loop

quit2A:
li $t6, 0
L2AA:			# End of Loop for 4 x A^3
bge $t6, $s2, quit2AA
add $t7, $t7, $s6
addi $t6, $t6, 1
j L2AA	

quit2AA:		# Loop for finding 3 x C^2
li $t6, 0
L3:
bge $t6, $t2, quit3
add $s3, $s3, $t2
addi $t6, $t6, 1
j L3			

quit3:			
li $t6, 0
L3A:
bge $t6, 3, quit3A
add $s0, $s0, $s3
addi $t6, $t6, 1
j L3A			# End of loop

quit3A:			# Loop 2 x D
li $t6, 0
L4:
bge $t6, 2, quit4 
add $s4, $s4, $t3
addi $t6, $t6, 1
j L4

quit4:
li $t6, 0
li $s1, 0

L5:
bge $t6, $t1, quit5
add $s1, $s1, $t1
addi $t6, $t6, 1
j L5

quit5:
li $t6, 0
li $s2, 0

L6:
bge $t6, $t0, quit6
add $s2, $s2, $s1
addi $t6, $t6, 1
j L6			# End of Loop 

quit6:			# C^2
li $t6, 0
li $s1, 0
L7:
bge $t6, $t2, quit7
add $s1, $s1, $t2
addi $t6, $t6, 1
j L7

quit7:			# D^2
li $t6, 0
li $s6, 0
L8:
bge $t6, $t3, quit8
add $s6, $s6, $t3
addi $t6, $t6, 1
j L8

quit8:			# D^3
li $t6, 0
li $s7, 0
L9:
bge $t6, $t3, quit9
add $s7, $s7, $s6
addi $t6, $t6, 1
j L9

quit9:			# C^2 x D^2
li $t6, 0
li $s3, 0
L10:
bge $t6, $s1, end
add $s3, $s3, $s7
addi $t6, $t6, 1
j L10

end:
li $t8, 0
sub $t8, $s5, $t7	
add $t8, $t8, $s0
sub $t8, $t8, $s4

li $t9, 0
add $t9, $s2, $s3

# Display equation 1

li $v0, 4			# Display Decimal
la $a0, decimal
syscall

li $v0, 1
move $a0, $t8			# Moving $a0
syscall

li $v0, 4
la $a0, newLine			# Adds a newline between answers
syscall

li $v0, 4
la $a0, binary			# Display Binary
syscall

li $v0, 35
move $a0, $t8			# Moving $a0
syscall

li $v0, 4
la $a0, newLine			# Adds a newline between answers
syscall

# Display Equation 2

li $v0, 4
la $a0, decimal2		# Display Decimal
syscall

li $v0, 1
move $a0, $t9			# Moving $a0
syscall

li $v0, 4
la $a0, newLine			# Adds a newline between answers
syscall

li $v0, 4
la $a0, binary2			# Display Binary
syscall

li $v0, 35
move $a0, $t9			
syscall

li $v0, 4
la $a0, newLine			# Adds a newline between answers
syscall

li $v0, 10			# Ending the Program
syscall




	



