#include "dora.h"

int putsn (char *string, FILE* fileoutput)
{
    if (fileoutput == NULL)
    {
        printf ("ERROR fileoutput have zero adres");
        return -1;
    }
    if (string == NULL)
    {
        printf ("ERROR string have zero adress");
        return -1;
    }
    char symbol_to_write = '0';
    if ((*string != '\n') && (*string != '\0'))
    {
        for (int symbol_number = 0; (symbol_to_write != '\n') && (symbol_to_write != '\0'); symbol_number++)
        {
            symbol_to_write = *(string + symbol_number);
            /*putchar (string [symbol_number]);*/
            if (fputc (symbol_to_write, fileoutput) == EOF)
            {
                printf ("ERROR in function : %s \n", __func__);
            }
        }
        if (ferror (stdin) == 0)
        {
            return 1;
        }
        else 
        {
            return -0xBADDEAD;
        }
    }
    else
    {
        return EOF;
    }
}