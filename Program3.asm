.data
ask: .asciiz "enter number: "
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
.text

main:
	la $s1, array			#address
	li $t1, 0 			#i = 0
	li $t3, 20			#number of vals in array
	li $t4, -1			#print -1 if not found
	j userinput
	
userinput:	
	li $v0, 4			#ask user for input
	la $a0, ask
	syscall
	li $v0, 5			#take in user input val
	syscall
	move $t5, $v0			#store value
	j loop
loop:
	beq $t1, $t3, notfound		#loop 
	lw $t6, 0($s1)			#array[i]
	beq $t5, $t6, found 		#if input = array[i]
	addi $s1, $s1, 4		#next val in array
	addi $t1, $t1, 1		#i++
	j loop
found:
	li $v0, 1			#print index
	move $a0, $t1
	syscall
	j end

notfound:
	bne $t5, $t6, nfoutput

nfoutput:	
	li $v0, 1			#print failure statement
	move $a0, $t4
	syscall
	j end

end:
	li $v0, 10
	syscall				#end of program
