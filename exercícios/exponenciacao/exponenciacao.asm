#José Ulisses - 3° Computação
.data
	valX: .word 0
	valY: .word 4
	valRes: .word 8
.text

.globl main
main:
	li $s0, 2
	li $s1, 3
	
	sw $s0, valX
	sw $s1, valY
	jal power
	
	lw $t0, valRes
	li $v0, 1
	move $a0, $t0
	syscall
	
	j exit
	
power:
	lw $s2, valX
	lw $s3, valY
	li $t1, 1
	
	blt $s3, $t0, for
	mult $s2, $t1
	mflo $t1
	
	addi $t0, $t0, 1
for:
	lw $t1, valRes
	jr $ra
	

exit:
	#encerra o programa
	li $v0, 10
	syscall