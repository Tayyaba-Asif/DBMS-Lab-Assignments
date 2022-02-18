#include <iostream>
#include <unistd.h>

using namespace std;

bool isPrime(int num)
{
	if (num == 1)
	{
		return true;
	}
	else
	{
		double result;
		int divisor = num - 1;
		while (num != -1)
		{
			result = num % divisor;
			if (result == 0)
			{
				num = -1;
			}
			else
			{
				divisor = divisor - 1;
			}
		}

		if (divisor == 1)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}

void printNumbers(int start, int end)
{
    int count = 0;
	int num;
	for (num = start; num <= end; num++)
	{
        if (isPrime(num))
        {
		printf("%d ", num);
        count+=1;
        }        
	}
    printf("\nTotal prime numbers are %d \n", count);
}

int main()
{
	int n1, n2;
	n1 = fork();
	n2 = fork();

	// n1 > 0 && n2 > 0 parent process
	if (n1 > 0 && n2 > 0)
	{
		cout << "Parent process :" << endl;
		printNumbers(2, 25001);
        printf("\n");
	}

	// n1 = 0 && n2 > 0 1st child process executes
	else if (n1 == 0 && n2 > 0)
	{
		cout << "1st child process :";
		printNumbers(25001, 50001);
        printf("\n");
	}

	// n1 > 0 && n2 = 0 2nd child process executes
	else if (n1 > 0 && n2 == 0)
	{
		cout << "2nd child process :";
		printNumbers(50001, 75001);
        printf("\n");
	}

	// then n1 = 0 && n2 = 0 3rd child process executes
	else if (n1 == 0 && n2 == 0)
	{
		cout << "3rd child process :" << endl;
		printNumbers(75001, 100001);
        printf("\n");
	}

	return 0;
}
