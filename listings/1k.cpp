// BUILD FOR ARM: aarch64-linux-android-g++ main.cpp -O0 -std=c++11 -Wl,-q -pie -ftemplate-depth=1000000 -o main_ARM64 -D CSIZE=1000 -D CSTEP=10
// BUILD FOR X86: g++ main.cpp -O0 -std=c++11 -lpthread -ftemplate-depth=1000000 -o main_x86 -D CSIZE=1000 -D CSTEP=10
#include <cstdio> 
#include <cstdlib>
#include <cstdint>
#include <pthread.h>
#include <unistd.h>
#include <limits>

template<uint32_t param>
double falseFunc(uint32_t i, uint32_t* FALSE)
{
    if (i == std::numeric_limits<uint32_t>::max()) {
        falseFunc<param-1>(i, FALSE);
    }
    (*FALSE)++;
    return 1.0/(i + param);
}

template<>
double falseFunc<0>(uint32_t i, uint32_t* FALSE)
{
    (*FALSE)++;
    return 1.0/(i + 1);
}

template<uint32_t param>
double trueFunc(uint32_t i, uint32_t* TRUE)
{
    if (i == std::numeric_limits<uint32_t>::max()) {
        trueFunc<param-1>(i, TRUE);
    }
    (*TRUE)++;
    return 2.0/(i + param);
}

template<>
double trueFunc<0>(uint32_t i, uint32_t* TRUE)
{
    (*TRUE)++;
    return 2.0/(i + 1);
}

// values from 0 to 2
// 0 - always true
// 2 - always false
template<uint32_t param>
uint32_t condition(uint32_t i, uint32_t arg) // 0-2
{
    if (i == std::numeric_limits<uint32_t>::max()) {
        condition<param-1>(i, arg);
    }
    double val = 1 + ((i*i + param) % 2); // 1-2
    return val > arg;
}

template<>
uint32_t condition<0>(uint32_t i, uint32_t arg)
{
    double val = 1 + ((i*i) % 2);
    return val > arg;
}

template<uint32_t param>
void *calcFunc(void *calc_args) 
{
    char** argv = (char**) calc_args;
    double res = 0.0;
    uint32_t TRUE = 0, FALSE = 0;
    uint32_t arg = (atoi(argv[1]) + param) % 3;
    uint32_t itNumber = atoi(argv[2]);
    
    if (itNumber == std::numeric_limits<uint32_t>::max()) {
        calcFunc<param-1>(calc_args);
    }

    for (uint32_t i = 1; i <= itNumber; i++)
    {
        if (condition<param>(i, arg))
        {
            res += trueFunc<param>(i, &TRUE);
        } else {
            res += falseFunc<param>(i, &FALSE);
        }
    }
    return nullptr;
}

template<>
void *calcFunc<0>(void *calc_args) 
{
    char** argv = (char**) calc_args;
    double res = 0.0;
    uint32_t TRUE = 0, FALSE = 0;
    uint32_t arg = (atoi(argv[1])) % 3;
    uint32_t itNumber = atoi(argv[2]);

    for (uint32_t i = 1; i <= itNumber; i++)
    {
        if (condition<0>(i, arg))
        {
            res += trueFunc<0>(i, &TRUE);
        } else {
            res += falseFunc<0>(i, &FALSE);
        }
    }
    return nullptr;
}

#ifndef CSIZE
    #define CSIZE 1000
#endif
const uint32_t CODE_SIZE = CSIZE;

#ifndef CSTEP
    #define CSTEP 10
#endif
const uint32_t CODE_STEP = CSTEP;

template<uint32_t param>
void *hotFunc(void *calc_args)
{
    calcFunc<param>(calc_args);
    hotFunc<param - CODE_STEP>(calc_args);
    return nullptr;
}

template<>
void *hotFunc<0>(void *calc_args) 
{
    calcFunc<0>(calc_args);
    return nullptr;
}
   
int main(int argc, char* argv[]) 
{ 
    if (argc != 4)
    {
        printf("ERROR! Need three arguments - barrier [0..10], iterations number and hot repetitions\n");
        printf("  0 - always true\n  1 - 50/50\n  2 - always false\n");
        return 1;
    }
    uint32_t hot_repeat = atoi(argv[3]);
    calcFunc<CODE_SIZE>(argv);
    for (uint32_t i = 0; i < hot_repeat; i++)
    {
        hotFunc<CODE_SIZE>(argv);
    }
    printf("SUCCESS\n");
    return 0;
}