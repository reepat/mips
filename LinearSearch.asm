	#this program search for the largest value in an array
	.data
output: .asciiz "Largest in given array is "
arr:	.word 10, 3, 45, 90, 12
	.text
	.globl main
	
main:	
	la $t0, arr		#load address of array
	li $t1, 20		#elements
	lw $t2, 0($t0)		#max is at arr[0]
	li $t3, 4		#i=1

loop:
	beq $t3, $t1, exit
	add $t4, $t3, $t0
	lw $t5, 0($t4) 	
	bge $t2, $t5, continue 	#if max > arr[i]
	move $t2, $t5		#if max < arr[i], max = arr[i]
continue:	
	addi $t3, $t3, 4 	#i++
	blt $t3, $t1, loop 	#i<5
	li $v0, 4 		#print output
	la $a0, output
	syscall
	li $v0, 1 		#print max
	move $a0, $t2
	syscall
exit:	
	li $v0, 10
	syscall
