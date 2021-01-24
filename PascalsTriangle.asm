	.data
Data:
	.word 0,0,0,0,0,0,0,0,0,0,1

	.text
Main:

	#$t2 = size
	#$t3 = counter
	# $t4 = index
	la $t0, Data #$t0 holds Data array
	li $t1, 10 #array index max
	li $t2, 1 #size of array
	li $t3, 0 #counter
	move $t4, $t1 #index
Loop:
	jal Index
	jal PascalsOp

CheckingLoop:		
	add $t2, $t2, 1 #adding one to size after loop is complete
	li $t3, 0 #putting counter back to 0
	li $t4, 10 #reseting index to top
	#jal Read
	blt $t2, $t1, Loop # size < max
	j Final
	
Final:
	#final closing statement
	
	

	
Read:
	#prints out statement
	
		
				
	#s1 = data[i]
	#s2 = data[i-1]	
	#s4 = previous index
	#$t4 = index
	
PascalsOp:
	move $s1, $s3
	sub $t4, $t4, 1
	jal Index #getting data[i-1] into s3
	move $s2, $s3
	add $s1, $s1, $s2
	jal AddingIntoArray
	move $s1, $s3
	add $t3, $t3, 1
	bne $t3, $t2, PascalsOp # if counter is less than size $t3 != $t2
	
	j CheckingLoop
	

Index:
	add $t5, $t4, 0 #pulling index of number, index stored in t3
	sll $t5, $t5, 2 #multiply by 4
	add $t6, $t5, $t0 #add for index
	lw $s3, 0($t6) #number stored here from array in s1
	jr $ra
	
AddingIntoArray:
	add $t5, $t4, 0 #pulling index of number, index stored in t3
	sll $t5, $t5, 2 #multiply by 4
	add $t6, $t5, $t0 #add for index
	sw $s1, 0($t6) #number stored here from array in s1
	jr $ra

	
	
		
	
