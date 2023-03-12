#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include <stdlib.h>

double falseFunc(uint32_t last, uint32_t* FALSE)
{
  (*FALSE)++;
  double res = 0;
  for (uint32_t i = 1; i < last; i++)
  {
    res += 1.0/i;
  }
  return res;
}

double trueFunc(uint32_t last, uint32_t* TRUE)
{
  (*TRUE)++;
  double res = 0;
  for (uint32_t i = 1; i < last; i++)
  {
    res += 1.0/i;
  }
  return res;
}

// values from 0 to 10
// 0 - always true
// 10 - always false
uint32_t condition(uint32_t i, uint32_t arg)
{
  double val = sin(i*i);
  double barrier = arg/5.0 - 1.0;
  return val > barrier;
}

int main(int argc, char** argv)
{
  if (argc != 2)
  {
    printf("ERROR! Need one argument - barrier [0..10]\n");
    printf("  0 - always true\n  5 - 50/50\n 10 - always false\n");
    return 1;
  }
  double res = 0.0;
  uint32_t TRUE = 0, FALSE = 0;
  for (uint32_t i = 1; i < 10000000; i++)
  {
    if (condition(i, atoi(argv[1])))
    {
      res += trueFunc(i%10 + 1, &TRUE);
    } else {
      res += falseFunc(i%10 + 1, &FALSE);
    }
  }
  printf("[T:%d | F:%d] %lf\n", TRUE, FALSE, res);
  return 0;  
}
