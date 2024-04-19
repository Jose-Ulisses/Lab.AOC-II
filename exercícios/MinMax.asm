#José Ulisses - Lab.Aoc - II
.data
array: .word 34, 7, 23, 32, 15, 88, 26, 12, 29, 5   # vetor com 10 posições
msg1: .asciiz "Min= "
msg2: .asciiz "\nMax= "
.text

.globl main
main:
	la $s0, array          # Carrega o endereço base do vetor em $s0
    	li $t0, 0                  # Inicializa o índice i = 0
    	lw $t1, 0($s0)       # Inicializa $t1 com o primeiro elemento do vetor (min = array[0])

	lw $t2, 0($s0)       # Inicializa $t2 com o primeiro elemento do vetor (max = array[0])
	li $t3, 10               # Tamanho do vetor

loop:
	beq $t0, $t3, exit
	lw $s1, ($s0)
	slt $t4, $s1, $t1  
	bne $t4, 1, min
	add $t1, $s1, $zero
	
min:
	sgt $t5, $s1, $t2
	bne $t5, 1, max
	add $t2, $s1, $zero 

max:
	addi $s0, $s0, 4
	addi $t0, $t0, 1
	j loop
		
exit:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 1
	add $a0, $t1, $zero
	syscall
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	add $a0, $t2, $zero
	syscall
	

	li $v0, 10             # Encerra o programa
	syscall