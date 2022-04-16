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

#define $ printf("\t\t\t---ON LINE %d IN FUNCTION %s---\n", __LINE__, __func__);

#define _H_TABLE_VERIFICATE_                                                                  \
        do{                                                                                   \
            CHECK_ERROR_(hash_table, "ZERO PTR TABLE INPUT", -1);                             \
            /*int error = HashVerificate (hash_table);                                          \
            if (error > 0)                                                                    \
            {                                                                                 \
                HashTableDumpTxt (hash_table, __FILE__, __LINE__, __func__);                  \
                HashTableDumpVis (hash_table);                                                \
                return error;                                                                 \
            }*/                                                                               \
        }while(0)


int HashCtor (HashTable* hash_table, const int size)
{
    CHECK_ERROR_(hash_table, "ZERO PTR INPUT", -1);

    hash_table->list = (List*) calloc (size, sizeof (List));
    CHECK_ERROR_(hash_table->list, "CALLOC HAS FALLEN", -1);

    for (int i = 0; i < size; i++)
    {
        list_ctor (&(hash_table->list[i]));
    }

    hash_table->key_value = 0;
    hash_table->HashFunc = NULL;

    return 0;
}

int HashDtor (HashTable* hash_table)
{
    CHECK_ERROR_(hash_table, "ZERO PTR INPUT HASH_TABLE", -1);
    CHECK_ERROR_(hash_table->list, "ZERO PTR INPUT LIST", -1);

    if (hash_table->key_value == -1)
    {
        printf ("HashTable is dstrutced\n");
        return -1;
    }

    //HashTableDumpVis (hash_table);
    //HashTableDumpTxt (hash_table, __FILE__, __LINE__, __func__);
    
    for (int i = 0; i < HASH_TABLE_SIZE; i++)
    {
        list_dtor (&(hash_table->list[i]));
    }

    hash_table->key_value = -1;
    hash_table->HashFunc = NULL;

    free (hash_table->list);

    return 0;
}

int HashTableClear (HashTable* hash_table)
{
    _H_TABLE_VERIFICATE_;

    for (int i = 0; i < HASH_TABLE_SIZE; i++)
    {
        List* list = &(hash_table->list[i]);

        list->next[0] = 0;
        list->prev[0] = 0;
        list->sorted = 1;

        memset ((void*) list->data,        0, list->capacity * sizeof (value_t));
        memset ((void*) (list->next + 1),  0, (list->capacity - 1) * sizeof (int));
        memset ((void*) (list->prev + 1),  0, (list->capacity - 1) * sizeof (int));

        list->head = 1;
        list->tail = 1;
        list->free = 1;
        list->size = 0;

        for (int j = 1; j < list->capacity; j++)
        {
            list->next[j] = j + 1;
        }

        list->next[list->capacity - 1] = 0;
    }

    hash_table->HashFunc = 0;

    return 0;
}

int FHashPush (HashTable* hash_table, __m128i* buffer, const int str_amount)
{
    _H_TABLE_VERIFICATE_;
    CHECK_ERROR_(hash_table->HashFunc, "ZERO PTR FUNC INPUT", -1);
    CHECK_ERROR_(buffer, "ZERO PTR ONEGIN STRUCT INPUT", -1);
    
    for (int i = 0; i < str_amount; i++)
    {
        List* cur_list = 0;
        //char* str = (char*) (&buffer [i]);
        /*for (int k = 0; k < MAX_WORD; k++)
        {
            printf ("%c", str[k]);
        }
        printf ("\n");*/

        if (HashFind (hash_table, &(buffer [i]), &cur_list) <= 0)
        {
            continue;
        }
        else
        {
            list_end_push (&(buffer [i]), cur_list);
        }
    }
    
    return 0;
}
/*
int FHashPush (HashTable* hash_table, Onegin* line, const int str_amount)
{
    _H_TABLE_VERIFICATE_;
    CHECK_ERROR_(hash_table->HashFunc, "ZERO PTR FUNC INPUT", -1);
    CHECK_ERROR_(line, "ZERO PTR ONEGIN STRUCT INPUT", -1);

    for (int i = 0; i < str_amount; i++)
    {
        char* str = line[i].adress;

        long long hash_val = hash_table->HashFunc (str);
        hash_val = hash_val % HASH_TABLE_SIZE;
        List* cur_list = &(hash_table->list[hash_val]);

        if (cur_list->size == 0)
        {
            list_start_push (str, cur_list);
        }
        else
        {
            list_end_push (str, cur_list);
        }
    }

    return 0;
}
*/

int HashFind (HashTable* hash_table, __m128i* str, List** found_list)
{
    _H_TABLE_VERIFICATE_;
    //printf ("Im in\n");
    CHECK_ERROR_(str, "ZERO PTR INPUT", -1);

    char* str_casted = (char*) (str);
    long long hash_val = hash_table->HashFunc (str_casted);
    hash_val = hash_val % HASH_TABLE_SIZE;
    *found_list = &(hash_table->list[hash_val]);
    int cur_ptr = (*found_list)->head;

    //__m128i str_intr = _mm_loadu_si128 ((const __m128i *)str);
    //str = (char*) (&str_intr);

    while ((*found_list)->data[cur_ptr] != NULL)
    {   
        //__m128i value = *((*found_list)->data [cur_ptr]);
        //char* val_str = (char*) (&value);

        //__m128i res = _mm_cmpeq_epi64 (*str, value);//_mm_cmpestrc (str_intr, 2, value, 2, _SIDD_UWORD_OPS | _SIDD_CMP_EQUAL_EACH);
        //int mask   = _mm_movemask_epi8 (res);
        //_mm_cmpistri (*str, value, _SIDD_UWORD_OPS | _SIDD_CMP_EQUAL_EACH | _SIDD_NEGATIVE_POLARITY| _SIDD_LEAST_SIGNIFICANT) == 0
        if (memcmp (str, (*found_list)->data[cur_ptr], MAX_WORD * sizeof (char)) == 0)
        {
            /*printf ("%s = ", str_casted);
            printf ("%s\n", val_str);*/

            return 0;
        }

        cur_ptr = (*found_list)->next[cur_ptr];
    }
    //printf ("Im out\n");
    return 1;
}



long long HashFuncOne (char* str_ptr)
{
    CHECK_ERROR_(str_ptr, "ZERO PTR INPUT", -1);
    
    return 1;
}

long long HashFuncAsciiFirstLetter (char* str_ptr)
{
    CHECK_ERROR_(str_ptr, "ZERO PTR INPUT", -1);
    
    return str_ptr[0];
}

long long HashFuncLength (char* str_ptr)
{
    CHECK_ERROR_(str_ptr, "ZERO PTR INPUT", -1);
    
    return strchr (str_ptr, '\0') - str_ptr;
}

long long HashFuncAsciiAllLeters (char* str_ptr)
{
    CHECK_ERROR_(str_ptr, "ZERO PTR INPUT", -1);

    int sum = 0;
    int i = 0;
    while (str_ptr [i] != '\0')
    {
        sum = sum + (int) str_ptr [i];
        i++;
    }
    
    return sum;
}

long long HashFuncRol (char* str_ptr)
{
    CHECK_ERROR_(str_ptr, "ZERO PTR INPUT", -1);

    unsigned long sum    = str_ptr [0];
    return sum;
    int res_op = 0;
    //int val_op = 0;
    int letter = 0;

    int i = 1;
    while ((letter = str_ptr [i]) != '\0')
    {
        __asm__ __volatile__(
                    "mov eax, %1\n\t"
                    "rol eax, 1\n\t"
                    "mov %0, eax\n\t" 
                    : "=r"(res_op) /* выходные операнды */
                    : "r"(sum) /* входные операнды */
                    : "%eax" /* разрушаемые регистры */
                );

        /*res_op = sum << 1;
        val_op = sum >> 31;

        res_op = val_op && res_op;*/
        sum = pow (res_op, letter);
        i++;
    }

    return sum;
}


long long MurmurHash2 (char * key)
{
    /*__m128i str_intr = _mm_loadu_si128 ((const __m128i *)key);
    return _mm_crc32_u64 (str_intr, strlen (key));*/
    CHECK_ERROR_(key, "ZERO PTR INPUT", -1);

    unsigned int len = strchr (key, '\0') - key;
    const unsigned int m = 0x5bd1e995;
    const unsigned int seed = 0;
    const int r = 24;

    unsigned int h = seed ^ len;

    const unsigned char * data = (const unsigned char *)key;

    while (len >= 4)
    {
        unsigned int k = 0;
        
        k  = data[0];
        k |= data[1] << 8;
        k |= data[2] << 16;
        k |= data[3] << 24;

        k *= m;
        k ^= k >> r;
        k *= m;

        h *= m;
        h ^= k;

        data += 4;
        len -= 4;
    }

    switch (len)
    {
        case 3:
        {
            h ^= data[2] << 16;
            break;
        }
        case 2:
        {
            h ^= data[1] << 8;
            break;
        }
        case 1:
        {
            h ^= data[0];
            h *= m;
            break;
        }
        default:
        {
            break;
        }
    }

    h ^= h >> 13;
    h *= m;
    h ^= h >> 15;

    return (long long)h;
}

int HashVerificate (HashTable* hash_table)
{
    CHECK_ERROR_(hash_table, "ZERO PTR TABLE INPUT", -1);

    int error = 0;

    if (hash_table->list == NULL)
    {
        error = ERROR_LIST_ARRAY_ZERO_PTR;
        hash_table->error = "ERROR_LIST_ARRAY_ZERO_PTR";
    }

    for (int i = 0; i < HASH_TABLE_SIZE; i++)
    {
        error = error + list_verificate (&(hash_table->list[i])); 
    }

    if (error == 0)
    {
        hash_table->error = "NO ERROR";
    }

    return error;
}


int MakeDiagram (int* size_array, FILE* file_output)
{
    CHECK_ERROR_(size_array, "ZERO PTR ARRAY INPUT", -1);
    CHECK_ERROR_(file_output, "ZERO PTR FILE INPUT", -1);

    for (int i = 0; i < NUM_FUNCTIONS; i++)
    {
        fprintf (file_output, "Hash_%d;", i + 1);
        for (int j = 0; j < HASH_TABLE_SIZE; j++)
        {
            fprintf (file_output, "%d;", size_array[i * HASH_TABLE_SIZE + j]);
        }
        fprintf (file_output, "\n\n");
    }
    return 0;
}

#define _TIME_ 1000 * duration_cast<milliseconds>(system_clock::now().time_since_epoch()).count()

#define _SET_SIZE_ARRAY_(num, name)                                                             \
        do                                                                                      \
        {                                                                                       \
            HashTableClear (hash_table);                                                        \
            hash_table->HashFunc = name;                                                        \
            FHashPush (hash_table, buffer, str_amount);                                           \
            /*HashClearRepeat (hash_table);*/                                                       \
            for (int i = 0; i < HASH_TABLE_SIZE; i++)                                           \
            {                                                                                   \
                size_array[i + num * HASH_TABLE_SIZE] = hash_table->list[i].size;               \
            }                                                                                   \
        } while (0);
        
int MakeHashNDiagram (HashTable* hash_table, __m128i* buffer, const int str_amount, FILE* file_output)
{
    _H_TABLE_VERIFICATE_;
    CHECK_ERROR_(file_output, "ZERO PTR FILE INPUT", -1);
    CHECK_ERROR_(buffer, "ZERO PTR ONEGIN STRUCT INPUT", -1);

    //using namespace std::chrono;

    int* size_array = (int*) calloc (NUM_FUNCTIONS * HASH_TABLE_SIZE, sizeof (int));
    CHECK_ERROR_(size_array, "ERROR CALLOC", -1);

    hash_table->key_value = 1;

    _SET_SIZE_ARRAY_(0, HashFuncOne);
    _SET_SIZE_ARRAY_(1, HashFuncAsciiFirstLetter);
    _SET_SIZE_ARRAY_(2, HashFuncLength);
    _SET_SIZE_ARRAY_(3, HashFuncAsciiAllLeters);
    _SET_SIZE_ARRAY_(4, HashFuncRol);
    _SET_SIZE_ARRAY_(5, MurmurHash2);
    #undef _SET_SIZE_ARRAY_

    MakeDiagram (size_array, file_output);

    free (size_array);

    return 0;
}

#undef _TIME_
#undef CHECK_ERROR_
#undef $
#undef _H_TABLE_VERIFICATE_ 
