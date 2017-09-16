.data

.text
	# Add 300 to a temp register
	addi $t0, $0, 300
	# Add 5 to a temp register
	addi $t1, $0, 5
	
	# Divide 300 by 5 and store it into memory
	div $s0, $t0, $t1
	
	# Print
	li $v0, 1
	add $a0, $0, $s0
	syscall
