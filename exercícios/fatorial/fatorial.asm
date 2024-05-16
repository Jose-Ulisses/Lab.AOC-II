#José Ulisses - 3° Ciência da Computação
.data
	line: .asciiz "\n"
	vetor: .word 0

.text

.globl main
main:
	li $s0, 10
	move $s1, $s0
	
fatorial:	
	ble $s1, 1, exit
	subi $s1, $s1, 1
	mult $s1, $s0
	mflo $s0
			
#printa na tela

	li $v0, 4
	la $a0, line
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	j fatorial
exit:
	#encerra o programa
	li $v0, 10
	syscall