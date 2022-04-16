#include "HashTable.h"

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


int main ()
{
    FILE* file_input = fopen ("../input/text.txt", "r");
    CHECK_ERROR_(file_input, "NOT OPENED", -1);

    int str_amount = 0;
    __m128i* buffer = remove_trash_and_copy_in_buffer (&str_amount, file_input);

    if (ferror(file_input))
    {
        printf ("ERROR in function : %s \n"
                "writing file falled\n", __func__);
    }
    fclose (file_input);


    HashTable hash_table = {};
    HashCtor (&hash_table, HASH_TABLE_SIZE);

    FILE* file_output = fopen ("../output/table.scv", "w");
    CHECK_ERROR_(file_output, "NOT CREATED", -1);
    
    MakeHashNDiagram (&hash_table, buffer, str_amount, file_output);

    if (ferror(file_output))
    {
        printf ("ERROR in function : %s \n"
                "writing file falled\n", __func__);
    }
    fclose (file_output);
    
    HashDtor (&hash_table);
    free (buffer);
    printf ("A");

    return 0;
}

#undef CHECK_ERROR_