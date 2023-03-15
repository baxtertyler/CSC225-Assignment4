.global addOp
.global subOp
.global multiplyOp
.global divideOp
.global andOp
.global orOp
.global xorOp
.global shiftleftOp
.global shiftrightOp

# operation to add two numbers
addOp:
	add a0, a0, a1
	ret

# operation to subtract two numbers
subOp:
	sub a0, a0, a1
	ret

# operation to multiply two numbers
multiplyOp: 
	mul a0, a0, a1
	ret

# operation to divide two numbers
divideOp:
	div a0, a0, a1
	ret

# operation to and two numbers	
andOp:
	and a0, a0, a1
	ret

# operation to or two numbers
orOp:
	or a0, a0, a1
	ret

# operation to xor two numbers
xorOp:
	xor a0, a0, a1
	ret

# operation to shift number1 left by mumber2 didgits
shiftleftOp:
	sll a0, a0, a1
	ret

# operation to shift number1 right by mumber2 digits
shiftrightOp:
	srl a0, a0, a1
	ret
