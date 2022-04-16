#include "dora.h"

#define CHECK_ERROR_(name, type_error, ret)                                             \
        do{                                                                             \
            if (name == NULL)                                                           \
            {                                                                           \
                printf ("\nERROR in function : %s \n"                                   \
                        "%s have %s\n", __func__,                                       \
                        #name, type_error);                                             \
                return ret;                                                             \
            }                                                                           \
        } while (0)


int make_array_adress (char* buffer, const int str_amount, Onegin* line)
{
    if (line == NULL)
    {
        printf ("ERROR in function : %s \nline has zero adress\n", __func__);
        return -1;  
    }
    if (buffer == NULL)
    {
        printf ("ERROR in function : %s \nbuffer has zero adress\n", __func__);
        return -1;
    }
    
    char *adress_new_str = buffer;
    line[0].adress = buffer;
    int amount = 0;

    for (; amount < str_amount - 1; amount++)
    {
        int length = strchr (adress_new_str, ' ') - adress_new_str;
        line [amount      ].adress = adress_new_str;
        line [amount      ].length = length;
        adress_new_str = adress_new_str + length + 1;
        *(adress_new_str - 1) = '\0';
    }

    int length = strchr (adress_new_str, '\0') - adress_new_str;
    line [amount      ].adress = adress_new_str;
    line [amount      ].length = length;

    //printf ("%d\n", str_amount);

    /*for (int i = 0; i < str_amount; i++)
    {
        printf ("%s\n", line[i].adress);
    }*/

    return 1;
}

int size_file (FILE *filestream)
{
    if (filestream == NULL)
    {
        printf ("ERROR in function : %s \nfilestream have zero adress\n", __func__);
        return -1;
    }

    fseek (filestream, 0, SEEK_END);

    int size = ftell (filestream);

    fseek (filestream, 0, SEEK_SET);
    
    return (size);
}

char* remove_trash_and_copy_in_buffer (int* str_amount, FILE* file)
{
    if (str_amount == NULL)
    {
        printf ("ERROR in function : %s \nstr_amount have zero adress\n", __func__);
        return NULL;
    }

    if (file == NULL)
    {
        printf ("ERROR in function : %s \ndora.txt didnt open\n", __func__);
        return NULL;
    }

    int size_buffer = size_file (file);

    char* buffer = (char*) calloc (size_buffer, sizeof (char));
    if (buffer == NULL)
    {
        printf ("ERROR in function : %s \nhaven't memory for buffer open\n", __func__);
        return NULL;
    }
    
    int amount_of_necessary_symbols = 0;
    char curSymbol = '0';
    char symbol_past = ' ';
    *str_amount = 1;

    for (;(curSymbol = getc (file)) != EOF;)
    {
        if ((curSymbol == '\n') && (symbol_past == ' '))
        {
            continue;
        }

        if ((curSymbol == symbol_past) &&
           ((curSymbol == ' ') || (curSymbol == '\t') || 
            (curSymbol == ',') || (curSymbol == '\n')))
        {
            continue;
        }
        if (curSymbol == '\n')
        {
            curSymbol = ' ';
        }
        if (curSymbol == ' ')
        {
            *str_amount = *str_amount + 1;
        }

        symbol_past = curSymbol;
        buffer [amount_of_necessary_symbols] = curSymbol;
        amount_of_necessary_symbols++;
    }
    
    for (int amount = amount_of_necessary_symbols; amount < size_buffer; amount++)
    {
        buffer [amount] = '\0';
    }
    
    return buffer;
}

Onegin* FMakeData (char** buffer, FILE* file_input, int* str_amount)
{
    CHECK_ERROR_(buffer, "ZERO PTR BUFFER INPUT", NULL);
    CHECK_ERROR_(file_input, "ZERO PTR FILE INPUT", NULL);
    CHECK_ERROR_(str_amount, "ZERO PTR VAL INPUT", NULL);

    *buffer = remove_trash_and_copy_in_buffer (str_amount, file_input);
    
    Onegin* line = (Onegin*) calloc (*str_amount, sizeof (Onegin));
    CHECK_ERROR_(buffer, "CALLOC FALLED", NULL);
    
    make_array_adress (*buffer, *str_amount, line);

    return line;
}

#undef CHECK_ERROR_