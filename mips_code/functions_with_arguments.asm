.data

.text 

	main:
	  # add numbers to argurment registers
	  addi $a1, $zero, 45
	  addi $a2, $0, 73
	  
	  # call function
	  jal addNumbers
	  
	  # print out values
	  li $v0, 1
	  add $a0, $v1 ,$0	# add value of function to argument register
	  syscall 
	
	# finish program
	li $v0, 10
	syscall 
	
	# function that add two numbers
	addNumbers:
	  add $v1, $a1, $a2
	  jr $ra 