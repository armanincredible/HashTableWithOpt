#include <stdio.h>
#include <ctype.h>
#include <math.h>
#include <assert.h>
#include <cstdlib>
#include <string.h> 
#include <immintrin.h>
#include <nmmintrin.h>

struct Onegin
{
    __m128i* adress;
    int length;
};

char** read_text            (FILE *filestream, char** array, const int str_amount, char *buffer);
int    size_file            (FILE *filestream);
int    make_array_adress    (__m128i* buffer, const int str_amount, Onegin* line);
__m128i*  remove_trash_and_copy_in_buffer (int* str_amount, FILE* file);

int FMakeData (__m128i** buffer, FILE* file_input, int* str_amount);