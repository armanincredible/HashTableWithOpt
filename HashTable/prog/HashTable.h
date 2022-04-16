#ifndef HASHTABLEHADER
#define HASHTABLEHADER

#include "../library/onegin/dora.h"
#include "../library/list/list.h"
#include <ctime>
#include "time.h"
#include <chrono>
#include <limits.h>

enum ErrorsHash
{
    ERROR_LIST_ARRAY_ZERO_PTR = 14,
    NO_ERROR_HASH = 15

};

const int HASH_TABLE_SIZE = 16;
const int NUM_FUNCTIONS = 6;

struct HashTable
{
    List* list = 0;
    int key_value = 0;
    unsigned int (*HashFunc)(char* str_ptr) = 0;
    const char* error;
};

int HashCtor (HashTable* hash_table, const int size);
int HashDtor (HashTable* hash_table);
int HashTableClear (HashTable* hash_table);

int FHashPush (HashTable* hash_table, Onegin* line, const int str_amount);
int HashFind (HashTable* hash_table, char* str, List** found_list);
int MakeHashNDiagram (HashTable* hash_table, Onegin* line, const int str_amount, FILE* file_output);

unsigned int HashFuncOne (char* str_ptr);
unsigned int HashFuncAsciiFirstLetter (char* str_ptr);
unsigned int HashFuncLength (char* str_ptr);
unsigned int HashFuncAsciiAllLeters (char* str_ptr);
unsigned int HashFuncRol (char* str_ptr);
unsigned int MurmurHash2 (char * key);

int HashClearRepeat (HashTable* hash_table);

int HashTableDumpTxt (HashTable* hash_table, const char* file, const int line, const char* funct);
int HashTableDumpVis (HashTable* hash_table);
int HashVerificate (HashTable* hash_table);
int MakeDiagram (int* size_array, FILE* file_output);

#endif