#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>  
#include<stdlib.h>

int main()
{

 
int rank = 0;

for(int i = 0; i <= 3; ++i) 
{
	if (fork() == 0)
	{
		rank = rank + i;
		break;
	}
        
}

        
if(rank==0)
        {
         int number=1;
         int n =25;
         printf("proccess 0 \n");
		 while(number <= n)
		{
			//printing the numbers
			printf("%d \n",number);
			//increasing loop counter by 1
			number++;
		}

        }


        if(rank==1)
        {
         int number=26;
         int n =50;
         printf("proccess 1 \n");
		 while(number <= n)
		{
			//printing the numbers
			printf("%d \n",number);
			//increasing loop counter by 1
			number++;
		}

        }


          if(rank==2)
        {
         int number=51;
         int n =75;
         printf("proccess 2\n");
		 while(number <= n)
		{
			//printing the numbers
			printf("%d \n",number);
			//increasing loop counter by 1
			number++;
		}

        }


           if(rank==3)
        {
         int number=76;
         int n =100;
         printf("proccess 3 \n");
		 while(number <= n)
		{
			//printing the numbers
			printf("%d \n",number);
			//increasing loop counter by 1
			number++;
		}

         }

return 0;
}