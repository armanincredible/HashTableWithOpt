#ifndef HASHTABLEHADER
#define HASHTABLEHADER

#include "../library/onegin/dora.h"
#include "../library/list/list.h"
#include <ctime>
#include "time.h"
#include <chrono>
#include <immintrin.h>
#include <nmmintrin.h>

enum ErrorsHash
{
    ERROR_LIST_ARRAY_ZERO_PTR = 14,
    NO_ERROR_HASH = 15

};

const int HASH_TABLE_SIZE = 16;
const int NUM_FUNCTIONS = 6;
const int MAX_WORD = 16;

struct HashTable
{
    List* list = 0;
    int key_value = 0;
    long long (*HashFunc)(char* str_ptr) = 0;
    const char* error;
};

int HashCtor (HashTable* hash_table, const int size);
int HashDtor (HashTable* hash_table);
int HashTableClear (HashTable* hash_table);

int FHashPush (HashTable* hash_table, __m128i* buffer, const int str_amount);
int HashFind (HashTable* hash_table, __m128i* str, List** found_list);
int MakeHashNDiagram (HashTable* hash_table, __m128i* buffer, const int str_amount, FILE* file_output);

long long HashFuncOne (char* str_ptr);
long long HashFuncAsciiFirstLetter (char* str_ptr);
long long HashFuncLength (char* str_ptr);
long long HashFuncAsciiAllLeters (char* str_ptr);
long long HashFuncRol (char* str_ptr);
long long MurmurHash2 (char * key);

int HashTableDumpTxt (HashTable* hash_table, const char* file, const int line, const char* funct);
int HashTableDumpVis (HashTable* hash_table);
int HashVerificate (HashTable* hash_table);
int MakeDiagram (int* size_array, FILE* file_output);

#endif