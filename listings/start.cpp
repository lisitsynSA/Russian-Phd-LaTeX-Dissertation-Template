// BUILD FOR ARM: aarch64-linux-android-clang++ start_ARM.S start.cpp -nostdlib -O0 -std=c++11 -Wl,-q -pie -ftemplate-depth=1000000 -o ARM_nostdlib -D CSIZE=1000 -D CSTEP=10
// BUILD FOR X86: g++ start_x86.S start.cpp -nostdlib -O0 -std=c++11 -ftemplate-depth=1000000 -o x86_nostdlib -D CSIZE=1000 -D CSTEP=10

#define UINT_MAX 4294967295

template<unsigned int param>
double falseFunc(unsigned int i, unsigned int* FALSE)
{
    if (i == UINT_MAX) {
        falseFunc<param-1>(i, FALSE);
    }
    (*FALSE)++;
    return 1.0/(i + param);
}

template<>
double falseFunc<0>(unsigned int i, unsigned int* FALSE)
{
    (*FALSE)++;
    return 1.0/(i + 1);
}

template<unsigned int param>
double trueFunc(unsigned int i, unsigned int* TRUE)
{
    if (i == UINT_MAX) {
        trueFunc<param-1>(i, TRUE);
    }
    (*TRUE)++;
    return 2.0/(i + param);
}

template<>
double trueFunc<0>(unsigned int i, unsigned int* TRUE)
{
    (*TRUE)++;
    return 2.0/(i + 1);
}

// values from 0 to 2
// 0 - always true
// 2 - always false
template<unsigned int param>
unsigned int condition(unsigned int i, unsigned int arg) // 0-2
{
    if (i == UINT_MAX) {
        condition<param-1>(i, arg);
    }
    double val = 1 + ((i*i + param) % 2); // 1-2
    return val > arg;
}

template<>
unsigned int condition<0>(unsigned int i, unsigned int arg)
{
    double val = 1 + ((i*i) % 2);
    return val > arg;
}

template<unsigned int param>
double calcFunc(unsigned int calc_args) 
{
    double res = 0.0;
    unsigned int TRUE = 0, FALSE = 0;
    unsigned int arg = param % 3;
    unsigned int itNumber = calc_args;
    
    if (itNumber == UINT_MAX) {
        calcFunc<param-1>(calc_args);
    }

    for (unsigned int i = 1; i <= itNumber; i++)
    {
        if (condition<param>(i, arg))
        {
            res += trueFunc<param>(i, &TRUE);
        } else {
            res += falseFunc<param>(i, &FALSE);
        }
    }
    return res;
}

template<>
double calcFunc<0>(unsigned int calc_args) 
{
    double res = 0.0;
    unsigned int TRUE = 0, FALSE = 0;
    unsigned int arg = 0;
    unsigned int itNumber = calc_args;

    for (unsigned int i = 1; i <= itNumber; i++)
    {
        if (condition<0>(i, arg))
        {
            res += trueFunc<0>(i, &TRUE);
        } else {
            res += falseFunc<0>(i, &FALSE);
        }
    }
    return res;
}

#ifndef CSIZE
    #define CSIZE 1000
#endif
const uint32_t CODE_SIZE = CSIZE;

#ifndef CSTEP
    #define CSTEP 10
#endif
const uint32_t CODE_STEP = CSTEP;

template<unsigned int param>
double hotFunc(unsigned int calc_args)
{
    return calcFunc<param>(calc_args) + hotFunc<param - CODE_STEP>(calc_args);
}

template<>
double hotFunc<0>(unsigned int calc_args) 
{
    return calcFunc<0>(calc_args);
}
   
int main() 
{
    unsigned int hot_repeat = 100000;
    calcFunc<CODE_SIZE>(1);
    for (unsigned int i = 0; i < hot_repeat; i++)
    {
        hotFunc<CODE_SIZE>(1);
    }
    return 0;
}