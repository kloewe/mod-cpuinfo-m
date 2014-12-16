/*----------------------------------------------------------------------------
  File    : mxCpuinfo.c
  Contents: processor information queries
  Author  : Kristian Loewe
----------------------------------------------------------------------------*/
#include <inttypes.h>
#include "mex.h"
#include "cpuinfo.h"

/*--------------------------------------------------------------------------*/

#define nproc  1  /* to check definitions */
#define mmx    2
#define sse    3
#define sse2   4
#define sse3   5
#define ssse3  6
#define sse41  7
#define sse42  8
#define popcnt 9

/*--------------------------------------------------------------------------*/

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    int32_t *result;
    plhs[0] = mxCreateNumericMatrix(1, 1, mxINT32_CLASS, mxREAL);
    result = (int32_t *)mxGetData(plhs[0]);

    #if   FEATURE==nproc
    result[0] = proccnt();
    #elif FEATURE==mmx
    result[0] = hasMMX();
    #elif FEATURE==sse
    result[0] = hasSSE();
    #elif FEATURE==sse2
    result[0] = hasSSE2();
    #elif FEATURE==sse3
    result[0] = hasSSE3();
    #elif FEATURE==ssse3
    result[0] = hasSSSE3();
    #elif FEATURE==sse41
    result[0] = hasSSE41();
    #elif FEATURE==sse42
    result[0] = hasSSE42();
    #elif FEATURE==popcnt
    result[0] = hasPOPCNT();
    #elif FEATURE==avx
    result[0] = hasAVX();
    #endif
}
