#This program subtracts the int value in array b from the int value in array a, and stores them in array c, which is printed
	.data
A: .word 10, 5, 6, 15, 17, 19, 25, 30, 12, 56
B: .word 4, 15, 16, 5, 7, 9, 15, 10, 22, 6
C: .space 10
output: .asciiz "Result is "
	.text
main:   
	la $t1, A
	la $t2, B
	la $t3,	C
	li $t4, 0		#i=0
	li $s1, 10		#length	
print:
	li $v0, 4		#printing out "Result is"
	la $a0, output
	syscall
loop:
	beq $t4, $s1, exit	#end loop
	lw $t5, 0($t1)		#A[i]
	lw $t6, 0($t2)		#B[i]
	sub $t7, $t5, $t6	#C[i] = A[i]-B[i]
	sw $t7, 0($t3)		#C[i]
	li $v0, 1
	move $a0, $t7		#print C[i]
	syscall
	li $a0, 32		#print space
	li $v0, 11
	syscall
	addi $t1, $t1, 4	#next value in A
	addi $t2, $t2, 4	#next value in B
	addi $t4, $t4, 1	#i++
	j loop			#go back through the loop
exit:
	li $v0, 10
	syscall			#end the program
