#include "list.h"

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

#define _LIST_DUMP_(list)                                                                     \
        do{                                                                                   \
            /*list_dump_tree (list);  */                                                          \
            /*list_dump_text (list, __FILE__, __LINE__, __func__);  */                            \
        }while(0)


#define _VERIFICATE_                                                                    \
        do{                                                                             \
            /*int error = list_verificate (list);                                         \
                                                                                        \
            if (error > 0)                                                              \
            {                                                                           \
                _LIST_DUMP_(list);                                                      \
                return error;                                                           \
            }*/                                                                           \
        } while (0)

static int  list_resize      (List *list);

static int  size_cmp_resize  (List *list);


//static int  list_dump_text   (const List* list, const char* file, const int line, const char* funct);

int list_ctor (List* list)
{
    CHECK_ERROR_(list, "NULL ADRESS", -1);

    list->data = (value_t*) calloc (BASIC_SIZE_LIST, sizeof (value_t));
    CHECK_ERROR_(list->data, "NULL ADRESS (HAVENT MEMORY)", -1);
    
    list->next = (int*) calloc (BASIC_SIZE_LIST, sizeof (int));
    CHECK_ERROR_(list->next, "NULL ADRESS (HAVENT MEMORY)", -1);

    list->prev = (int*) calloc (BASIC_SIZE_LIST, sizeof (int));
    CHECK_ERROR_(list->prev, "NULL ADRESS (HAVENT MEMORY)", -1);

    //memset ((void*)list->data, 0, BASIC_SIZE_LIST * sizeof (value_t));

    list->next[0] = 0;
    list->prev[0] = 0;
    list->sorted = 1;

    /*memset ((void*)(list->next + 1), -1, (BASIC_SIZE_LIST - 1) * sizeof (int));
    memset ((void*)(list->prev + 1), -1, (BASIC_SIZE_LIST - 1) * sizeof (int));*/

    list->head = 1;
    list->tail = 1;
    list->free = 1;
    list->size = 0;
    list->capacity = BASIC_SIZE_LIST;

    for (int i = 1; i < BASIC_SIZE_LIST; i++)
    {
        list->next[i] = i + 1;
    }
    list->next[BASIC_SIZE_LIST - 1] = 0;

    list_verificate (list);

    return 0;
}

int list_dtor (List* list)
{
    CHECK_ERROR_(list,       "NULL ADRESS", -1);
    CHECK_ERROR_(list->data, "NULL ADRESS", -1);
    CHECK_ERROR_(list->next, "NULL ADRESS", -1);
    CHECK_ERROR_(list->prev, "NULL ADRESS", -1);

    _VERIFICATE_;
    
    //_LIST_DUMP_(list);

    memset ((void*) list->data,        0, list->capacity * sizeof (value_t));
    memset ((void*) (list->next + 1),  0, (list->capacity - 1) * sizeof (int));
    memset ((void*) (list->prev + 1),  0, (list->capacity - 1) * sizeof (int));
    
    free (list->data);
    free (list->next);
    free (list->prev);
    
    list->sorted   = -1;

    list->size     = -1;
    list->capacity = -1;
    list->free     = -1;
    list->head     = -1;
    list->tail     = -1;

    return 0;
}

/*
int list_push (int type, value_t value, int ptr, List* list)
{
    CHECK_ERROR_(list, "NULL ADRESS", -1);

    _VERIFICATE_;

    size_cmp_resize (list);

    int save_next_of_free = list->next[list->free];

    #define DEF_CMD(num, name, arg)     \
            if (type == name)           \
            {                           \
                arg                     \
            }                       

    #include "push.def"

    #undef DEF_CMD

    if (save_next_of_free != 0)
    {
        list->free = save_next_of_free;
    }
    list->size = list->size + 1;

    _VERIFICATE_;
    
    return 0;
}*/

int list_end_push (value_t value, List* list)///////BACK
{
    CHECK_ERROR_(list, "NULL ADRESS", -1);

    _VERIFICATE_;

    size_cmp_resize (list);

    int save_next_of_free = list->next[list->free];

    list->data[list->free] = value;

    list->next[list->tail] = list->free;
    list->prev[list->free] = list->tail;
    if (list->tail == 1)
    {
        list->prev[list->head] = 0;
    }
    
    list->tail = list->free;
    list->next[list->tail] = 0;

    if (save_next_of_free != 0)
    {
        list->free = save_next_of_free;
    }
    list->size = list->size + 1;

    _VERIFICATE_;
    
    return 0;
    
}

int list_start_push (value_t value, List* list)///////////FRONT
{
    CHECK_ERROR_(list, "NULL ADRESS", -1);

    _VERIFICATE_;

    size_cmp_resize (list);

    int save_next_of_free = list->next[list->free];

    list->data[list->free] = value;

    if (list->size > 0)
    {
        list->next[list->free] = list->head;
        list->prev[list->head] = list->free;
    }
    else 
    {
        list->next[list->free] = 0;
        list->prev[list->head] = 0;
    }


    list->prev[list->free] = 0;

    list->head = list->free;

    if (save_next_of_free != 0)
    {
        list->free = save_next_of_free;
    }
    list->size = list->size + 1;

    list->sorted = 0;

    _VERIFICATE_;
    
    return 0;
}

int list_between_push (value_t value, int ptr, List* list)
{
    CHECK_ERROR_(list, "NULL ADRESS", -1);

    _VERIFICATE_;

    size_cmp_resize (list);

    int save_next_of_free = list->next[list->free];

    list->next[list->free] = list->next[ptr];
    list->prev[list->free] = ptr;
    list->data[list->free] = value;

    list->prev[list->next[ptr]] = list->free;

    list->next[ptr] = list->free;

    if (save_next_of_free != 0)
    {
        list->free = save_next_of_free;
    }
    list->size = list->size + 1;

    list->sorted = 0;

    _VERIFICATE_;
    
    return 0;
}

int list_clean_repeat (List* list)
{
    CHECK_ERROR_(list, "NULL ADRESS", -1);
    _VERIFICATE_;

    int cur_ptr = list->head; 

    for (int i = 0; i < list->size; i++)
    {
        value_t str = list->data[cur_ptr];
        int ptr = list->next[cur_ptr];

        while (list->data[ptr] != NULL)
        {
            if (strcmp (str, list->data[ptr]) == 0)
            {
                int save_ptr = list->next[ptr];
                list_delete (ptr, list);
                ptr = save_ptr;
            }
            else
            {
                ptr = list->next[ptr];
            }
        }

        cur_ptr = list->next[cur_ptr];
    }

    _VERIFICATE_;
    return 0;
}


int list_delete (int ptr, List* list)
{
    CHECK_ERROR_(list, "NULL ADRESS", -1);

    _VERIFICATE_;

    if (ptr == list->tail)
    {
        list->tail = list->prev[list->tail];
        list->next[list->prev[ptr]] = 0;
    }
    else if (ptr == list->head)
    {
        list->head = list->next[list->head];
        list->prev[list->head] = 0;
    }
    else
    {
        list->next[list->prev[ptr]] = list->next[ptr];
        list->prev[list->next[ptr]] = list->prev[ptr];
        list->sorted = 0;
    }

    list->next[ptr] = list->free;
    list->prev[ptr] = 0;

    list->data[ptr] = 0;

    list->free = ptr;

    list->size = list->size - 1;

    _VERIFICATE_;

    return 0;
}

static int list_resize (List *list)
{
    CHECK_ERROR_(list, "NULL ADRESS", -1);

    _VERIFICATE_;
    
    list->capacity = list->capacity * 2;

    list->data = (value_t*) realloc ((void*)list->data, list->capacity * sizeof (value_t));
    CHECK_ERROR_(list->data, "NULL ADRESS (haven't memory) ", -1);

    list->next = (int*) realloc ((void*)list->next, list->capacity * sizeof (int));
    CHECK_ERROR_(list->next, "NULL ADRESS (haven't memory) ", -1);

    list->prev = (int*) realloc ((void*)list->prev, list->capacity * sizeof (int));
    CHECK_ERROR_(list->next, "NULL ADRESS (haven't memory) ", -1);

    list->free = list->size + 1;

    for (int i = list->size + 1; i < list->capacity; i++)
    {
        list->next[i] = i + 1;
    }
    list->next[list->capacity - 1] = 0;

    memset ((void*)(list->data + list->size + 1), 0, (list->capacity - list->size - 1) * sizeof (value_t));

    memset ((void*)(list->prev + list->size + 1), 0, (list->capacity - list->size - 1) * sizeof (int));

    _VERIFICATE_;

    return 0;
}

static int size_cmp_resize (List* list)
{
    CHECK_ERROR_(list, "NULL ADRESS", -1);

     if (list->size >= list->capacity - 2)
    {
        list_resize(list);
    }
    return 0;
}
/*
int list_dump_tree (const List* list)
{
    FILE* output_file = fopen ("../output/list/list_dump.dot", "w");
    CHECK_ERROR_(output_file, "NOT CREATED", -1);

    fprintf (output_file, "\tdigraph dump_graph{\n"
                          "\trankdir=HR;\n");

    for (int i = 0; i < list->capacity; i++)
    {
        fprintf (output_file, "\t%d [shape = \"ellipse\", label = \" %d\\nvalue %s, next %d, prev %d\"];\n", i, i, list->data[i], list->next[i], list->prev[i]);
        if (i > 1)
        {
            fprintf(output_file, "\t%d -> %d[style=invis];\n", i - 1, i);
        }
    }

    fprintf (output_file, "\tINFO [shape = record, label = \" <hd> HEAD | <tl> TAIL | <fr> FREE\"];\n");
    fprintf (output_file, "\tINFO: <hd> -> %d [color= \"blue\"];\n", list->head);
    fprintf (output_file, "\tINFO: <tl> -> %d [color= \"blue\"];\n", list->tail);
    fprintf (output_file, "\tINFO: <fr> -> %d [color= \"red\"];\n", list->free);

    int ptr = list->head;

    for (int i = 1; (i <= list->size) && (list->next[ptr] != 0); i++)
    {
        fprintf (output_file, "\t%d -> %d [color= \"blue\"];\n", ptr, list->next[ptr]);
        ptr = list->next[ptr];
    }

    ptr = list->free;
    
    for (int i = list->free; (i < list->capacity - 1) && (list->next[ptr] != 0); i++)
    {
        fprintf (output_file, "\t%d -> %d [color= \"red\"];\n", ptr, list->next[ptr]);
        ptr = list->next[ptr];
    }

    fprintf(output_file, "}");

    if (ferror(output_file))
    {
        printf ("ERROR in function : %s \n"
                "writing file falled\n", __func__);
        return -1;
    }
    
    fclose (output_file);

    //system ("\"C:/Program Files/Graphviz/bin/dot.exe\" -Tpng ../output/list/list_dump.dot -o ../output/list/graph.png");

    return 0;

}*/
/*
static int list_dump_text (const List* list, const char* file, const int line, const char* funct)
{
    FILE* list_status_file = fopen ("../output/list/list_status.html", "w");
    CHECK_ERROR_(list_status_file, "NOT CREATED", -1);

    fprintf (list_status_file, "<pre>\n");

    fprintf (list_status_file,  "List have %s at %s at (%s:%d) \n\n",
            list->error, file, funct, line);

    fprintf (list_status_file,
        "Capacity = %d\n" "Size = %d\n"
        "head = %d\n" "tail = %d\n" "free = %d\n" 
        "Pointer of next = %p\n" "Pointer of prev = %p\n" "Pointer of data = %p\n\n",
        list->capacity, list->size, 
        list->head, list->tail, list->free, 
        (void*)list->next, (void*)list->prev, (void*)list->data);

    if ((list->next != NULL) && (list->data != NULL) && (list->prev != NULL))
    {
        for (int i = 0; i < list -> capacity - 1; i++)
        {
            fprintf (list_status_file, 
                "%d : value = %s -- next = %d -- prev = %d\n",
                i, list->data[i], list->next[i], list->prev[i]);
        }
    }

    fprintf (list_status_file, "\nEND OF TXT\n \t\t\t\\Thanks for using our program\\");

    if (ferror(list_status_file))
    {
        printf ("ERROR in function : %s \n"
                "writing file falled\n", __func__);
        return -1;
    }

    fprintf (list_status_file, "<center><img src = \"../output/list/graph.png\">");


    fclose (list_status_file);

    return 0;
}*/

int list_phy_by_log (List* list, int ptr_log)
{
    CHECK_ERROR_ (list, "NULL ADRESS", -1);

    if (list->sorted == 1)
    {
        return ptr_log;
    }

    int ptr_phy = list->head;
    for (int i = 0; i < ptr_log; i++)
    {
        ptr_phy = list->next[ptr_phy];
        printf ("*");
    }

    return ptr_phy;
}

int list_linearise (List* list)
{
    CHECK_ERROR_ (list, "NULL ADRESS", -1);

    if (list->sorted == 1)
    {
        return 0;
    }

    if (list->size == 0)
    {
        printf ("TI KONCHENNIE");
        return -1;
    }
    _VERIFICATE_;

    value_t* save_ptr_data = list->data;
    /*int* save_ptr_prev = list->prev;*/
    int* save_ptr_next = list->next;

    list->data = (value_t*) calloc (list->capacity, sizeof (value_t));
    CHECK_ERROR_(list->data, "NULL ADRESS (HAVENT MEMORY)", -1);
    
    list->next = (int*) calloc (list->capacity, sizeof (int));
    CHECK_ERROR_(list->next, "NULL ADRESS (HAVENT MEMORY)", -1);

    /*list->prev = (int*) calloc (list->capacity, sizeof (int));
    CHECK_ERROR_(list->prev, "NULL ADRESS (HAVENT MEMORY)", -1);*/

    memset ((void*)list->data, 0, list->capacity * sizeof (value_t));
    memset ((void*)(list->next + 1), -1, (list->capacity - 1) * sizeof (int));

    int cur_operation = 1;

    list->next[0] = 0;
    list->prev[0] = 0;
    list->prev[1] = 0;

    list->tail = list->size;
    list->free = list->size + 1;

    for (int i = list->head; cur_operation != list->capacity; i = save_ptr_next[i])
    {
        list->data[cur_operation] = save_ptr_data[i];

        list->next[cur_operation] = cur_operation + 1;
        

        if ((cur_operation == list->size) || (cur_operation == list->capacity - 1))
        {
            list->next[cur_operation] = 0;
        }

        if ((cur_operation > 1) && (cur_operation <= list->size))
        {
            list->prev[cur_operation] = cur_operation - 1;
        }

        if (cur_operation > list->size)
        {
            list->prev[cur_operation] = -1;
        }

        cur_operation++;
    }

    list->head = 1;

    free(save_ptr_data);
    /*free(save_ptr_prev);*/
    free(save_ptr_next);

    _VERIFICATE_;

    return 0;
}


int list_verificate (List* list)
{
    CHECK_ERROR_ (list,       "NULL ADRESS", -1);
    CHECK_ERROR_ (list->data, "NULL ADRESS", -1);
    CHECK_ERROR_ (list->prev, "NULL ADRESS", -1);
    CHECK_ERROR_ (list->next, "NULL ADRESS", -1);

    if (list == NULL)
    {
        list->error = "LIST_PTR_ERROR";
        return LIST_PTR_ERROR;
    }

    if (list->data == NULL)
    {
        list->error = "DATA_PTR_ERROR";
        return DATA_PTR_ERROR;
    }

    if (list->prev == NULL)
    {
        list->error = "PREV_PTR_ERROR";
        return PREV_PTR_ERROR;
    }

    if (list->next == NULL)
    {
        list->error = "NEXT_PTR_ERROR";
        return NEXT_PTR_ERROR;
    }

    if (list->head <= 0)
    {
        list->error = "HEAD_VAL_ERROR";
        return HEAD_VAL_ERROR;
    }

    if (list->tail <= 0)
    {
        list->error = "TAIL_VAL_ERROR";
        return TAIL_VAL_ERROR;
    }

    if (list->capacity <= 0)
    {
        list->error = "CAPACITY_VAL_ERROR";
        return CAPACITY_VAL_ERROR;
    }

    if (list->size < 0)
    {
        list->error = "SIZE_VAL_ERROR";
        return SIZE_VAL_ERROR;
    }

    if (list->free <= 0)
    {
        list->error = "FREE_VAL_ERROR";
        return FREE_VAL_ERROR;
    }

    int cur_oper = 0;

    for (int i = 1; cur_oper < list->size; i = list->next[i])
    {
        if ((list->next[i] == 0) && (i != list->tail))
        {
            list->error = "NEXT_DATA_VAL_ERROR";
            return NEXT_DATA_VAL_ERROR;
        }

        if (list->next[i] == 0)
        {
            break;
        }


        if ((list->size > 0) && (i != list->prev[list->next[i]]))
        {
            list->error = "NEXT_PREV_VAL_ERROR";
            return NEXT_PREV_VAL_ERROR;
        }

        if ((i > list->head) && (i != list->next[list->prev[i]]))
        {
            list->error = "NEXT_PREV_VAL_ERROR";
            return NEXT_PREV_VAL_ERROR;
        }

        cur_oper++;
    }

    cur_oper = 0;
    bool have_end = 0;

    for (int i = list->free; cur_oper < list->capacity - list->size; i = list->next[i])
    {
        if (list->size != list->capacity - 1)
        {
            if (list->data[i] != 0)
            {
                list->error = "FREE_VAL_ERROR";
                return FREE_VAL_ERROR;
            }
            if (list->next[i] == 0)
            {
                have_end = 1;
                break;
            }
            cur_oper++;
        }
        else 
        {
            have_end = 1;
            break;
        }
    }

    if (have_end == 0)
    {
        list->error = "NEXT_FREE_VAL_ERROR";
        return NEXT_FREE_VAL_ERROR;
    }

    list->error = "NO_ERROR";
    return NO_ERROR;
}

#undef $

#undef CHECK_ERROR_

#undef _VERIFICATE_

#undef _LIST_DUMP_