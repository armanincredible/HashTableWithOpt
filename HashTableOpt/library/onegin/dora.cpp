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

__m128i* remove_trash_and_copy_in_buffer (int* str_amount, FILE* file)
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

    __m128i* arr_word = (__m128i*) calloc (size_buffer, 16 * sizeof (char));
    if (arr_word == NULL)
    {
        printf ("ERROR in function : %s \nhaven't memory for buffer open\n", __func__);
        return NULL;
    }
    //memset (arr_word, '\0', size_buffer * 16 * sizeof (char));
    
    int amount_of_necessary_symbols = 0;
    int cur_word = 0;
    char curSymbol = '0';
    char symbol_past = ' ';
    *str_amount = 1;

    char* buffer = (char*) (&(arr_word[cur_word]));

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
            symbol_past = curSymbol;
            *str_amount = *str_amount + 1;
            cur_word++;
            buffer [amount_of_necessary_symbols] = '\0';
            amount_of_necessary_symbols = 0;
            buffer = (char*) (&(arr_word[cur_word]));
            continue;
        }

        symbol_past = curSymbol;
        buffer [amount_of_necessary_symbols] = curSymbol;
        amount_of_necessary_symbols++;
    }

    buffer [amount_of_necessary_symbols] = '\0';

    /*for (int i = 0; i < *str_amount; i++)
    {
        buffer = (char*) (&(arr_word[i]));
        printf ("%s\n", buffer); 
    }*/

    //printf ("%d", *str_amount);
    /*for (int amount = amount_of_necessary_symbols; amount < size_buffer; amount++)
    {
        buffer [amount] = '\0';
    }*/
    
    return arr_word;
}

int FMakeData (__m128i** buffer, FILE* file_input, int* str_amount)
{
    CHECK_ERROR_(buffer, "ZERO PTR BUFFER INPUT", -1);
    CHECK_ERROR_(file_input, "ZERO PTR FILE INPUT", -1);
    CHECK_ERROR_(str_amount, "ZERO PTR VAL INPUT", -1);

    *buffer = remove_trash_and_copy_in_buffer (str_amount, file_input);

    return 0;
}

#undef CHECK_ERROR_