.data 

.text 

	main:
		jal divide
	# tell system that program is done
	li $v0,10
	syscall 
	
	divide:
		addi $t0 , $zero, 50	# Add 50 to register
		addi $t1, $zero, 10	# Add 10 to register
		div $s0, $t0, $t1	# 50/10 = 5
		li $v0, 1 		# print value
		syscall
		jr $ra			# return to main function