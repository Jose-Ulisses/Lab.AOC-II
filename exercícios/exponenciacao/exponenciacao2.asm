#José Ulisses - 3° Computação
.data
	valX: .word 0
	res: .word 4
.text

.globl main
main:
	li $s0, 2
	#joga pra memoria a base
	sw $s0, valX
	jal powerBase2
	
	#carrega o resultado da memoria
	lw $t0, res
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	j exit

powerBase2:
	#carrega o valor da base na memoria
	lw $s1, valX
	sll $s2, $s1, 3
	
	#joga pra memoria o resultado
	sw $s2, res
	jr $ra
	
exit:
	#encerra o programa
	li $v0, 10
	syscall
