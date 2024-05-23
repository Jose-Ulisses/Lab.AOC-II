.data
	valX: .word 0
	res: .word 4
.text

.globl main
main:
	li $s0, 3
	
	sw $s0, valX
	jal powerBase2
	
	lw $t0, res
	li $v0, 1
	move $a0, $t0
	syscall
	
	j exit

powerBase2:
	lw $s1, valX
	beq $t0, $s1, for
	sll $s1, $s1, 1
	addi $t0, $t0, 1
for:
	sw $s1, res
	jr $ra
exit:
	#encerra o programa
	li $v0, 10
	syscall