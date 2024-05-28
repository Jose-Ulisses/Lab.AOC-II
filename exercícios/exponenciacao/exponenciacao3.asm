#José Ulisses - 3° Computação
.data
	msg1: .asciiz "Informe o valor de X: "
	msg2: .asciiz "Informe o valor do expoente: "

	valX: .word 0
	valExp: .word 4
	res: .word 8
.text

.globl main
main:
	#imprime msg1 no terminal
	li $v0, 4
	la $a0, msg1
	syscall
	
	#input de x
	li $v0, 5
	syscall
	sw $v0, valX

	#imprime msg2 no terminal
	li $v0, 4
	la $a0, msg2
	syscall
	
	#input do expoente
	li $v0, 5
	syscall
	sw $v0, valExp
	
	jal powerbase3
	#carrega da memoria o resultado
	lw $t0, res
	
	#inprime o resultado
	li $v0, 1
	move $a0, $t0
	syscall
	
	j exit
	
powerbase3:
	#carrega da memoria o valor de x e do expoente
	li $s0, 2
	lw $s1, valX
	lw $s2, valExp
	
	#faz a exponenciacao
	sllv $s3, $s0, $s2
	srl $s3, $s3, 1
	
	#faz a multiplicacao
	mult $s3, $s1
	mflo $s3
	
	#joga na memoria o resultado
	sw $s3, res
	jr $ra
	
exit:
	#encerra o programa
	li $v0, 10
	syscall