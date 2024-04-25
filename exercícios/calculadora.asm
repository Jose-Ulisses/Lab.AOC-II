.data
	msg1: .asciiz "Informe o primeiro valor: "
	msg2: .asciiz "\nInforme o segundo valor: "
	msg3: .asciiz "\nInforme o operador: "

	operador: .word '+', '-', '/', '*'
.text

.globl main
main:
#le o primeiro valor
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	
	move $s0, $v0
	
#le o segundo valor
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	
	move $s1, $v0

#le o operador
	li $v0, 4
	la $a0, msg3
	syscall

	li $v0, 12
	syscall
	
	move $s2, $v0

#swiitch(operador)	

	
	
#encerra o programa

	li $v0, 10
	syscall	

	