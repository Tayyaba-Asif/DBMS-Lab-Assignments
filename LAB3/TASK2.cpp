#include<stdio.h>
#include<iostream>
#include<unistd.h>
using namespace std;
int main()
{
	
for (int i = 0; i < 3; i++)
	{
		fork();
	}
cout << "Hello from the process " << getpid() << endl;

}
