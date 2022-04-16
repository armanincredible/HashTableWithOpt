#include <stdio.h>
#include <ctype.h>
#include <math.h>
#include <assert.h>
#include <cstdlib>
#include <string.h> 

struct Onegin
{
    char* adress;
    int length;
};

char** read_text            (FILE *filestream, char** array, const int str_amount, char *buffer);
int    size_file            (FILE *filestream);
int    make_array_adress    (char* buffer, const int str_amount, Onegin* line);
char* remove_trash_and_copy_in_buffer (int* str_amount, FILE* file);

Onegin* FMakeData (char** buffer, FILE* file_input, int* str_amount);