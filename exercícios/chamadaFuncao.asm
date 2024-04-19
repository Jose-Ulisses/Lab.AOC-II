#José Ulisses - 3° Computação
.data
.text
	
.globl main
main:
	li $s0, 2
	li $s1, 3

	jal soma
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	
	jal subtracao
	li $v0, 1
	add $a0, $t1, $zero
	syscall
	j exit

soma:
	add $t0, $s0, $s1
	jr $ra
	
subtracao:
	sub $t1, $s0, $s1
	jr $ra

exit: