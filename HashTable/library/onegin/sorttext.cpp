#include <stdio.h>
#include <ctype.h>
#include <math.h>
#include <assert.h>
#include <cstdlib>
#include <string.h> 

sortext ()
{
    FILE *file_input = NULL;
    FILE *file_output = NULL;
    
    if ((file_input = fopen ("dora.txt", "r")) != NULL)
    {
        if ((file_output = fopen ("dorasorted.txt", "w")) != NULL)
        {
            char symbol = '0';
            char symbol_past = '0';
            int prove_need = 0;
            int new_string = 1;
            int am_strings = 1;

            for (;(symbol = getc (file_input)) != EOF;)
            {
                if ((new_string == 1) && (symbol == ' '))
                {
                    continue;
                }
                new_string = 0;

                if ((symbol == '\r') || (symbol == '\t'))
                {
                    continue;
                }

                if ((symbol == symbol_past) && ((symbol == ' ') || (symbol == ',')))
                {
                    continue;
                }

                if (symbol == '\n')
                {
                    am_strings++;
                    new_string = 1;
                }
                else
                {
                    symbol_past = symbol;
                }

                putc (symbol, file_output);
            }
            printf ("%d", am_strings);
        }
        else
        {
            printf ("ERROR FILE DORASORT.TXT WAS NOT DETECTED");
        }
    }
    else
    {
        printf ("ERROR FILE DORA.TXT WAS NOT DETECTED");
    }
    return file_output;
}