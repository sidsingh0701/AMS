#include <stdio.h>
#include <math.h>

int main(int argc, char*argv[])
{
    char hex[6];
    sscanf(argv[1],"%s",hex);
    
    //printf("%c\n",hex[0]);
    //printf("%c\n",hex[1]);
    double output;
    
    int exp, fraction;
    //int input [23] = {1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,1,0,1,1,1,0,1};
    int input [23];
    int i,j,buffer;
    buffer = 3;
    int sign = 0;
    for (i=1; i<6; i++)
    {
        //printf("%d\n",buffer);
        switch (hex[i])
        {
            case '0':
                input[buffer] = 0;
                input[buffer + 1] = 0;
                input[buffer + 2] = 0;
                input[buffer + 3] = 0;
                break;
            case '1':
                input[buffer] = 0;
                input[buffer + 1] = 0;
                input[buffer + 2] = 0;
                input[buffer + 3] = 1;
                break;
            case '2':
                input[buffer] = 0;
                input[buffer + 1] = 0;
                input[buffer + 2] = 1;
                input[buffer + 3] = 0;
                break;
            case '3':
                input[buffer] = 0;
                input[buffer + 1] = 0;
                input[buffer + 2] = 1;
                input[buffer + 3] = 1;
                break;
            case '4':
                input[buffer] = 0;
                input[buffer + 1] = 1;
                input[buffer + 2] = 0;
                input[buffer + 3] = 0;
                break;
            case '5':
                input[buffer] = 0;
                input[buffer + 1] = 1;
                input[buffer + 2] = 0;
                input[buffer + 3] = 1;
                break;
            case '6':
                input[buffer] = 0;
                input[buffer + 1] = 1;
                input[buffer + 2] = 1;
                input[buffer + 3] = 0;
                break;
            case '7':
                input[buffer] = 0;
                input[buffer + 1] = 1;
                input[buffer + 2] = 1;
                input[buffer + 3] = 1;
                break;
            case '8':
                input[buffer] = 1;
                input[buffer + 1] = 0;
                input[buffer + 2] = 0;
                input[buffer + 3] = 0;
                break;
            case '9':
                input[buffer] = 1;
                input[buffer + 1] = 0;
                input[buffer + 2] = 0;
                input[buffer + 3] = 1;
                break;
            case 'a':
                input[buffer] = 1;
                input[buffer + 1] = 0;
                input[buffer + 2] = 1;
                input[buffer + 3] = 0;
                break;
            case 'b':
                input[buffer] = 1;
                input[buffer + 1] = 0;
                input[buffer + 2] = 1;
                input[buffer + 3] = 1;
                break;
            case 'c':
                input[buffer] = 1;
                input[buffer + 1] = 1;
                input[buffer + 2] = 0;
                input[buffer + 3] = 0;
                break;
            case 'd':
                input[buffer] = 1;
                input[buffer + 1] = 1;
                input[buffer + 2] = 0;
                input[buffer + 3] = 1;
                break;
            case 'e':
                input[buffer] = 1;
                input[buffer + 1] = 1;
                input[buffer + 2] = 1;
                input[buffer + 3] = 0;
                break;
            case 'f':
                input[buffer] = 1;
                input[buffer + 1] = 1;
                input[buffer + 2] = 1;
                input[buffer + 3] = 1;
                break;
        }
        
        buffer = buffer + 4;
    }
    
    switch (hex[0])
    {
        case '0':
            sign = 0;
            input[0] = 0;
            input[1] = 0;
            input[2] = 0;
            break;
        case '1':
            sign = 0;
            input[0] = 0;
            input[1] = 0;
            input[2] = 1;
            break;
        case '2':
            sign = 0;
            input[0] = 0;
            input[1] = 1;
            input[2] = 0;
            break;
        case '3':
            sign = 0;
            input[0] = 0;
            input[1] = 1;
            input[2] = 1;
            break;
        case '4':
            sign = 0;
            input[0] = 1;
            input[1] = 0;
            input[2] = 0;
            break;
        case '5':
            sign = 0;
            input[0] = 1;
            input[1] = 0;
            input[2] = 1;
            break;
        case '6':
            sign = 0;
            input[0] = 1;
            input[1] = 1;
            input[2] = 0;
            break;
        case '7':
            sign = 0;
            input[0] = 1;
            input[1] = 1;
            input[2] = 1;
            break;
        case '8':
            sign = 1;
            input[0] = 0;
            input[1] = 0;
            input[2] = 0;
            break;
        case '9':
            sign = 1;
            input[0] = 0;
            input[1] = 0;
            input[2] = 1;
            break;
        case 'a':
            sign = 1;
            input[0] = 0;
            input[1] = 1;
            input[2] = 0;
            break;
        case 'b':
            sign = 1;
            input[0] = 0;
            input[1] = 1;
            input[2] = 1;
            break;
        case 'c':
            sign = 1;
            input[0] = 1;
            input[1] = 0;
            input[2] = 0;
            break;
        case 'd':
            sign = 1;
            input[0] = 1;
            input[1] = 0;
            input[2] = 1;
            break;
        case 'e':
            sign = 1;
            input[0] = 1;
            input[1] = 1;
            input[2] = 0;
            break;
        case 'f':
            sign = 1;
            input[0] = 1;
            input[1] = 1;
            input[2] = 1;
            break;
    }
    
    
    
    /*for (i=0; i<23; i++)
    {
        printf("%d",input[i]);
    }
    printf("\n");*/
    
	exp = fraction = j =0;
	for (i=5; i>=0; i--)
	{
		exp = exp + (pow(2,j)*input[i]);
		j++;
		//printf("%d ",input[i]);
	}

	j=0;
	for (i=22; i>=6; i--)
	{
		fraction = fraction + (pow(2,j)*input[i]);
		j++;
		//printf("%d ",input[i]);
	}

	//printf("\n");
	//printf("%d\n", exp);
	//printf("%d\n", fraction);

	output = pow(2,(exp-48)) * (1+(fraction/pow(2,17)));
    printf("Output: ");
    if (sign == 0)
        printf("+");
    else
        printf("-");

	printf("%e\n", output);

}
