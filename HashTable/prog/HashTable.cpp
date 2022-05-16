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

int FHashPush (HashTable* hash_table, Onegin* line, const int str_amount)
{
    _H_TABLE_VERIFICATE_;
    CHECK_ERROR_(hash_table->HashFunc, "ZERO PTR FUNC INPUT", -1);
    CHECK_ERROR_(line, "ZERO PTR ONEGIN STRUCT INPUT", -1);
    
    for (int i = 0; i < str_amount; i++)
    {
        List* cur_list = 0;
        char* str = line[i].adress;

        if (HashFind (hash_table, str, &cur_list) <= 0)
        {
            continue;
        }
        else
        {
            list_end_push (str, cur_list);
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

        unsigned int hash_val = hash_table->HashFunc (str);
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

int HashFind (HashTable* hash_table, char* str, List** found_list)
{
    _H_TABLE_VERIFICATE_;
    CHECK_ERROR_(str, "ZERO PTR INPUT", -1);

    //int str_length = strlen (str);
    unsigned int hash_val = hash_table->HashFunc (str);
    hash_val = hash_val % HASH_TABLE_SIZE;
    
    *found_list = &(hash_table->list[hash_val]);
    int cur_ptr = (*found_list)->head;
    char* value = (*found_list)->data[cur_ptr];

    while ((*found_list)->data[cur_ptr] != NULL)
    {
        if (strcmp (str, value) == 0)
        {
            return 0;
        }

        cur_ptr = (*found_list)->next[cur_ptr];
        value = (*found_list)->data [cur_ptr];
    }

    return 1;//ListFind (*found_list, str);
}

int ListFind (List* found_list, char* str)
{
    CHECK_ERROR_ (found_list, "ZERO PTR", -1);
    CHECK_ERROR_ (str, "ZERO PTR", -1);

    int cur_ptr = (found_list)->head;
    char* value = (found_list)->data[cur_ptr];

    while ((found_list)->data[cur_ptr] != NULL)
    {
        if (strcmp (str, value) == 0)
        {
            return 0;
        }

        cur_ptr = (found_list)->next[cur_ptr];
        value = (found_list)->data [cur_ptr];
    } 

    return 1;
}


int HashClearRepeat (HashTable* hash_table)
{
    _H_TABLE_VERIFICATE_;

    for (int i = 0; i < HASH_TABLE_SIZE; i++)
    {
        list_clean_repeat (&(hash_table->list[i]));
    }

    return 0;
}

unsigned int HashFuncOne (char* str_ptr)
{
    CHECK_ERROR_(str_ptr, "ZERO PTR INPUT", -1);
    
    return 1;
}

unsigned int HashFuncAsciiFirstLetter (char* str_ptr)
{
    CHECK_ERROR_(str_ptr, "ZERO PTR INPUT", -1);
    
    return str_ptr[0];
}

unsigned int HashFuncLength (char* str_ptr)
{
    CHECK_ERROR_(str_ptr, "ZERO PTR INPUT", -1);
    
    return strchr (str_ptr, '\0') - str_ptr;
}

unsigned int HashFuncAsciiAllLeters (char* str_ptr)
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

unsigned int HashFuncRol (char* str_ptr)
{
    CHECK_ERROR_(str_ptr, "ZERO PTR INPUT", -1);

    unsigned int sum = str_ptr [0];
    int letter = 0;

    int i = 1;
    while ((letter = str_ptr [i]) != '\0')
    {
        unsigned int res_op = 0;
        unsigned int val_op = 0;

        res_op = sum << 1;
        val_op = sum >> 31;
        res_op = val_op | res_op;
        sum = res_op ^ letter;
        i++;
    }

    return sum;
}


unsigned int MurmurHash2 (char * key)
{
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

    return (unsigned int)h;
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

int HashTableDumpVis (HashTable* hash_table)
{
    CHECK_ERROR_(hash_table, "ZERO PTR TABLE INPUT", -1);

    FILE* output_file = fopen ("../output/hash_dump.dot", "w");
    CHECK_ERROR_(output_file, "NOT CREATED", -1);

    fprintf (output_file, "\tdigraph dump_graph{\n"
                              "\trankdir=HR;\n");

    for (int j = 0; j < HASH_TABLE_SIZE; j++)
    {
        fprintf (output_file, "\tsubgraph HASH_%d {\n", j);
        List* list = &(hash_table->list[j]);
        
        for (int i = 0; i < list->capacity; i++)
        {
            fprintf (output_file, "\tF%p_%d [shape = \"ellipse\", label = \" %d\\nvalue %s, next %d, prev %d\"];\n", 
                                    (void*)(list), i, i, list->data[i], list->next[i], list->prev[i]);
            if (i > 1)
            {
                fprintf(output_file, "\tF%p_%d -> F%p_%d [style=invis];\n", (void*)(list), i - 1, (void*)(list), i);
            }
        }
    
        fprintf (output_file, "\tINFO%p [shape = record, label = \" <hd> HEAD | <tl> TAIL | <fr> FREE\"];\n", (void*)list);
        fprintf (output_file, "\tHASH_%d -> INFO%p\n", j + 1, (void*)list);
        fprintf (output_file, "\tINFO%p: <hd> -> F%p_%d [color= \"blue\"];\n", (void*)list, (void*) (list), list->head);
        fprintf (output_file, "\tINFO%p: <tl> -> F%p_%d [color= \"blue\"];\n", (void*)list, (void*) (list),  list->tail);
        fprintf (output_file, "\tINFO%p: <fr> -> F%p_%d [color= \"red\"];\n", (void*)list, (void*) (list),  list->free);

        int ptr = list->head;

        for (int i = 1; (i <= list->size) && (list->next[ptr] != 0); i++)
        {
            fprintf (output_file, "\tF%p_%d -> F%p_%d [color= \"blue\"];\n", (void*)(list), ptr, (void*) (list), list->next[ptr]);
            ptr = list->next[ptr];
        }

        ptr = list->free;
        
        for (int i = list->free; (i < list->capacity - 1) && (list->next[ptr] != 0); i++)
        {
            fprintf (output_file, "\tF%p_%d -> F%p_%d [color= \"red\"];\n", (void*)(list), ptr, (void*) (list), list->next[ptr]);
            ptr = list->next[ptr];
        }
        fprintf (output_file, "}\n");
    }
    fprintf(output_file, "}");

    if (ferror(output_file))
    {
        printf ("ERROR in function : %s \n"
                "writing file falled\n", __func__);
        return -1;
    }
    fclose (output_file);

    //system ("\"C:/Program Files/Graphviz/bin/dot.exe\" -Tsvg ../output/hash_dump.dot -o ../output/hash_graph.svg");

    return 0;
}

int HashTableDumpTxt (HashTable* hash_table, const char* file, const int line, const char* funct)
{
    CHECK_ERROR_(hash_table, "ZERO PTR TABLE INPUT", -1);

    FILE* list_status_file = fopen ("../output/hash_dump_txt.txt", "w");
    CHECK_ERROR_(list_status_file , "NOT CREATED", -1);

    fprintf (list_status_file, "Hash have %s at %s at (%s:%d) \n\n", hash_table->error, file, funct, line);
    fprintf (list_status_file, "Hash pointer = %p, pointer of array of lists = %p, hash have function = %d \n\n", 
                                (void*) hash_table, (void*) hash_table->list, hash_table->key_value);
    
    if (hash_table->list != NULL)
    {
        for (int j = 0; j < HASH_TABLE_SIZE; j++)
        {
            fprintf (list_status_file, "Hash %d list:\n", j);

            List* list = &(hash_table->list[j]);
            fprintf (list_status_file,  "\tList have %s\n\n",
                                        list->error);

            fprintf (list_status_file,
                "\tCapacity = %d\n" "\tSize = %d\n"
                "\thead = %d\n" "\ttail = %d\n" "\tfree = %d\n" 
                "\tPointer of next = %p\n" "\tPointer of prev = %p\n" "\tPointer of data = %p\n\n",
                list->capacity, list->size, 
                list->head, list->tail, list->free, 
                (void*)list->next, (void*)list->prev, (void*)list->data);

            if ((list->next != NULL) && (list->data != NULL) && (list->prev != NULL))
            {
                for (int i = 0; i < list -> capacity - 1; i++)
                {
                    fprintf (list_status_file, 
                        "\t%d : value = %s -- next = %d -- prev = %d\n",
                        i, list->data[i], list->next[i], list->prev[i]);
                }
            }
            fprintf (list_status_file, "\n\n\n");
        }
    }

    
    if (ferror(list_status_file))
    {
        printf ("ERROR in function : %s \n"
                "writing file falled\n", __func__);
        return -1;
    }
    fclose (list_status_file);

    return 0;
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
            FHashPush (hash_table, line, str_amount);                                           \
            /*HashClearRepeat (hash_table);*/                                                       \
            for (int i = 0; i < HASH_TABLE_SIZE; i++)                                           \
            {                                                                                   \
                size_array[i + num * HASH_TABLE_SIZE] = hash_table->list[i].size;               \
            }                                                                                   \
        } while (0);
        
int MakeHashNDiagram (HashTable* hash_table, Onegin* line, const int str_amount, FILE* file_output)
{
    _H_TABLE_VERIFICATE_;
    CHECK_ERROR_(file_output, "ZERO PTR FILE INPUT", -1);
    CHECK_ERROR_(line, "ZERO PTR ONEGIN STRUCT INPUT", -1);

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
