.data
	msg1: .asciiz "Informe o primeiro valor: "
	msg2: .asciiz "\nInforme o segundo valor: "
	msg3: .asciiz "\nInforme o operador: "
	msg4: .asciiz " = "
	msg5: .asciiz "\nResultado: "

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
	beq $s2, 43, soma
	beq $s2, 45, subt
	beq $s2, 42, multp
	beq $s2, 47, divis
	

#encerra o programa
exit:
	li $v0, 4
	la $a0, msg5
	syscall

	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 11
	move $a0, $s2
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall

	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall
			
	li $v0, 10
	syscall	

soma:
	add $s3, $s0, $s1
	j exit
subt:
	sub $s3, $s0, $s1
	j exit
multp:
	mult $s1, $s2
	j exit
divis:
	div $s3, $s0, $s1
	j exit
	
	
