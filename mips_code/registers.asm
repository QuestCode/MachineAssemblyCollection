.data 

.text 

	main:
	   addi $s0,$0,12
	   
	   jal addNum	
	   
	   # Ends the program
	   li $v0, 10
	   syscall 
	   
	addNum:
	   addi $sp,$sp, -4	# create space on the stack to store 4 bytes
	   sw $s0, 0($sp)	# store original value on to the stack using sw
	   
	   addi $s0, $s0, 19
	   
	   #print value
	   li $v0, 1
	   move $a0, $s0
	   syscall 
	   
	   lw $0, 0($sp)	# load original values back in to register
	   addi $sp,$sp,4	# return stack back to its original position
	   
	   jr $ra		# exit function
	   
	   