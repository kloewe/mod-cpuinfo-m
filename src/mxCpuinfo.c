/*----------------------------------------------------------------------------
  File    : mxCpuinfo.c
  Contents: processor information queries
  Author  : Kristian Loewe
----------------------------------------------------------------------------*/
#include <inttypes.h>
#include "mex.h"
#include "cpuinfo.h"

/*--------------------------------------------------------------------------*/

#define ncores  1  /* to check definitions */
#define nproc   2
#define mmx     3
#define sse     4
#define sse2    5
#define sse3    6
#define ssse3   7
#define sse41   8
#define sse42   9
#define popcnt 10
#define avx    11
#define fma3   12

/*--------------------------------------------------------------------------*/

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    int32_t *result;
    plhs[0] = mxCreateNumericMatrix(1, 1, mxINT32_CLASS, mxREAL);
    result = (int32_t *)mxGetData(plhs[0]);
    #if   FEATURE==ncores
    result[0] = corecnt();
    #elif FEATURE==nproc
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
    #elif FEATURE==fma3
    result[0] = hasFMA3();
    #else
    #  error "FEATURE: unexpected value"
    #endif
}  /* mexFunction() */
