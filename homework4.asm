	.data
array: .word 1 2 3 4 5
length: .word 5
	.text
main:
	la $a1,array
	lw $a2,length
	move $t0,$a2
	move $t2,$a1
	li $t3,0
	li $t1,0

loop:
	bge $t3,$t0,avg
	mul $t4,$t3,4	
	add $t4,$t4,$t2
	lw $t6,0($t4)
	add $t1,$t1,$t6
	addi $t3,$t3,1
	j loop
	
avg:
	div $t7,$t1,$t0
	move $v0, $t7
	j end

end:
	li $v0, 10
	syscall
