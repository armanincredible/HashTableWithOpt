#include "dora.h"

int main ()
{
    int str_amount = 0;//todo struct for text peremennie and function to inicialit it and free it//

    char* buffer = remove_trash_and_copy_in_buffer (&str_amount);
    
    struct Onegin* line = (Onegin*) calloc (str_amount, sizeof (Onegin));
    if (line == NULL)
    {
        printf ("ERROR in function : %s \n" 
                "haven't memory for struct line\n", __func__);
        return -1;
    }
    
    make_array_adress (buffer, str_amount, line);

    if (sort_and_output_text (line, str_amount, buffer) == -1)
    {
        printf ("ERROR in function : %s \nerror in funct sort_and_output_text\n", __func__);
    }

    free (buffer);
    free (line);

    return 0;
}
