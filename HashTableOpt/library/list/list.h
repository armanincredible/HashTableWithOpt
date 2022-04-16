#ifndef LISTHEADER
#define LISTHEADER

#include <stdio.h>
#include <ctype.h>
#include <math.h>
#include <stdlib.h>
#include <string.h> 
#include <immintrin.h>
#include <nmmintrin.h>

typedef __m128i* value_t;

/*struct Val_Ch
{
    const char* data;
    int val;
};*/

struct List 
{
    value_t* data;
    int* prev;
    int* next;
    int free;
    int head;
    int tail;
    int size;
    int capacity;
    const char* error;
    bool sorted;
};

enum Errors
{
    NO_ERROR,
    TAIL_VAL_ERROR,
    HEAD_VAL_ERROR,
    SIZE_VAL_ERROR,
    FREE_VAL_ERROR,
    CAPACITY_VAL_ERROR,
    LIST_PTR_ERROR,
    PREV_PTR_ERROR,
    NEXT_PTR_ERROR,
    DATA_PTR_ERROR,
    NEXT_DATA_VAL_ERROR,
    NEXT_FREE_VAL_ERROR,
    PREV_VAL_ERROR,
    NEXT_PREV_VAL_ERROR
};

const int BASIC_SIZE_LIST = 1024;

int     list_ctor           (List* list);

int     list_dtor           (List* list);

int     list_end_push       (value_t value, List* list);

int     list_start_push     (value_t value, List* list);

int     list_between_push   (value_t value, int ptr, List* list);


int     list_delete         (int ptr, List* list);

int     list_linearise      (List* list);

/*int     list_push           (int type, value_t value, int ptr, List* list);*/

int     list_phy_by_log     (List* list, int ptr_log);

int  list_verificate  (List* list);

//int  list_dump_tree   (const List* list);

#endif