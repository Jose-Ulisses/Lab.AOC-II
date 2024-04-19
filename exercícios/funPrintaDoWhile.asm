#josé ulisses - lab. AOC-II

.data
	str1: .asciiz "\nInforme a quantidade de vezes: "
	str2: .asciiz "\nInforme um numero:"
	
	valX: .word 30
.text
.globl main
main:
	li $v0, 4
	la $a0, str1
	syscall

	li $v0, 5
	syscall
	la $s0, ($v0)

	li $s1, 0

loop:
	ble $s0, $s1, exit
	li $v0, 4
	la $a0, str2
	syscall

	li $v0, 5
	syscall
	sw $v0, valX

	jal printa

	addi $s1, $s1, 1
	j loop

printa:
	li $v0, 1
	lw $s2, valX
	la $a0, ($s2)
	syscall
	jr $ra

exit: