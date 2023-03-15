#include <stdio.h>
#include <string.h>
#include "operations.h"

int main()
{
	int n1;
	int n2;
	int op;
	int result;

	printf("Welcome to the Calculator Program.\n");
	printf("Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7: xor 8:lshift 9: \n");

	char answer = '\0';
	while(answer != 'n'){
		printf("\nEnter number: ");
	scanf(" %d", &n1);
	printf("Enter second number: ");
	scanf(" %d", &n2);
	printf("Select operation: ");
	scanf(" %d", &op);
	if (op < 1 || op > 9)
	{
		printf("Result: Invalid Operation\n");
	}
	else
	{
		if (op == 1) result = add(n1, n2);
		if (op == 2) result = subtract(n1, n2);
		if (op == 3) result = multiply(n1, n2);
		if (op == 4) result = divide(n1, n2);
		if (op == 5) result = and_(n1, n2);
		if (op == 6) result = or_(n1, n2);
		if (op == 7) result = xor_(n1, n2);
		if (op == 8) result = lshift(n1, n2);
		if (op == 9) result = rshift(n1, n2);
		printf("Result: %d", result);
		printf("\nContinue (y/n)?: ");
	   	scanf(" %c", &answer);

	}
	
	}
	printf("\n");
	printf("Exiting\n");
	return 0;
}