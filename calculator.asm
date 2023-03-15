# calculator.asm

	.global main
	.text
main:
	lw	a0, "hello"
	la 	a0, strWelcome	# load string at strWelcome into a0 and print
	jal 	printString
	
	la	a0, strOpp	# load string at strOpp into a0 and print
	jal	printString	
	
while_outer:
	
	la 	a0, strEnter1	# load string at strEnter1 into a0 and print
	jal	printString	
	jal	readInt		# get int from user and move into s0
	mv 	s0, a0		
	
	la	a0, strEnter2	# load string at strEnter2 into a0 and print
	jal	printString	
	jal	readInt		# get int from user and move into s1
	mv	s1, a0		
	
	la	a0, strEnter3	# load string at strEnter3 into a0 and print
	jal	printString	
	jal	readInt		# get int from user and move into s3
	mv	s3, a0		
				
	li	t1, 1		
	blt	s3, t1, invalidOpReturn	# if ops < 1 go to invalid op
	li	t1, 10
	bge	s3, t1, invalidOpReturn	# if ops >= 10 go to invalid op
	
	
	li	t1, 1			
	beq	s3, t1, branch1	# if number entered is equal to 1, move to branch1
	
	li	t1, 2
	beq	s3, t1, branch2 # if number entered is equal to 2, move to branch2
	
	li	t1, 3
	beq	s3, t1, branch3	# if number entered is equal to 3, move to branch3
	
	li	t1, 4
	beq	s3, t1, branch4	# if number entered is equal to 4, move to branch4
	
	li	t1, 5
	beq	s3, t1, branch5	# if number entered is equal to 5, move to branch5
	
	li	t1, 6
	beq	s3, t1, branch6	# if number entered is equal to 6, move to branch6
	
	li	t1, 7
	beq	s3, t1, branch7	# if number entered is equal to 7, move to branch7
	
	li	t1, 8
	beq	s3, t1, branch8	# if number entered is equal to 8, move to branch8
	
	li	t1, 9
	beq	s3, t1, branch9	# if number entered is equal to 9, move to branch9
	
	
branch1:			# branch to calculate additon of the two inputs
	mv	a0, s0
	mv	a1, s1
	jal	addOp
	b	returnVal

branch2:			# branch to calculate subtraction of the two inputs
	mv	a0, s0
	mv	a1, s1
	jal	subOp
	b	returnVal

branch3:			# branch to calculate multiplication of the two inputs
	mv	a0, s0
	mv	a1, s1
	jal	multiplyOp
	b	returnVal

branch4:			# branch to calculate division of the two inputs
	mv	a0, s0
	mv	a1, s1
	jal	divideOp
	b	returnVal

branch5:			# branch to calculate and of the two inputs
	mv	a0, s0
	mv	a1, s1
	jal	andOp
	b	returnVal

branch6:			# branch to calculate or of the two inputs
	mv	a0, s0
	mv	a1, s1
	jal	orOp
	b	returnVal

branch7:			# branch to calculate xor of the two inputs
	mv	a0, s0
	mv	a1, s1
	jal	xorOp
	b	returnVal

branch8:			# branch to calculate left shift of the two inputs
	mv	a0, s0
	mv	a1, s1
	jal	shiftleftOp
	b	returnVal

branch9:			# branch to calculate right shift of the two inputs
	mv	a0, s0
	mv	a1, s1
	jal	shiftrightOp
	b	returnVal

invalidOpReturn:
	la	a0, strResult	# get the string at strResult and print it
	jal 	printString
	
	la	a0, strInvalidOp	# get the string at InvalidOp and print it
	jal	printString
	b	cont
	
returnVal:
	mv	s4, a0
	la 	a0, strResult	# load string at strRes into a0
	jal	printString	# ecall to print string in a0
	mv	a0, s4
	jal	printInt
	
cont:
	la 	a0, strContinue	# load string at strContinue into a0
	jal	printString	# ecall to print string in a0
	jal	readChar
	mv	t4, a0
	jal	printNewLine
	jal	printNewLine
	
	li 	t1, 110		# load ascii for "n" into t1
	beq	t4, t1, endwhile_outer # if input in a0 has same ascii as "n", branch to end of the loop
	b 	while_outer	# if not already branched to end, go back to top
	
endwhile_outer:
	la 	a0, exiting	# load string at exiting into a0
	li 	a7, 4		# print a0
	ecall			# system call
	
	li 	a7, 10		# exit the program
	ecall			# system call

	.data
strWelcome:	.string "Welcome to the Calculator program.\n"
strOpp:		.string "Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:lshift 9:rshift\n\n"
strEnter1:	.string "Enter number: "
strEnter2:	.string "Enter second number: "
strEnter3:	.string "Select operation: "
strInvalidOp:	.string	"Invalid Operation"

strResult:	.string	"Result: "
strContinue:	.string "\nContinue (y/n)?: "
exiting:	.string "Exiting"
