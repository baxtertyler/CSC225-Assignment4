#include <stdio.h>

/*
operations:
1: add
2: subtract
3: multiply
4: divide
5: and_
6: or_
7: xor_
8: lshift
9: rhift
*/

int add(int val1, int val2){
	return (val1 + val2);
}

int subtract(int val1, int val2){
	return (val1 - val2);
}

int multiply(int val1, int val2){
	return (val1 * val2);
}

int divide(int val1, int val2){
	return (val1 / val2);
}

int and_(int val1, int val2){
	return (val1 & val2);
}

int or_(int val1, int val2){
	return (val1 | val2);
}

int xor_(int val1, int val2){
	return (val1 ^ val2);
}

int lshift(int val1, int val2){
	return (val1 << val2);
}

int rshift(int val1, int val2){
	return (val1 >> val2);
}