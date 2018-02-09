/*----------------------------------------------------------------------------
  File    : mxCpuinfo.c
  Contents: processor information queries
  Author  : Kristian Loewe
----------------------------------------------------------------------------*/
#include "mex.h"
#include "cpuinfo.h"

/*----------------------------------------------------------------------------
  Gateway Function
----------------------------------------------------------------------------*/
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    int *result;
    plhs[0] = mxCreateNumericMatrix(1, 1, mxINT32_CLASS, mxREAL);
    result = (int *)mxGetData(plhs[0]);

    int f = *(int *)mxGetData(prhs[0]);

    if      (f ==  1)
      *result = corecnt();
    else if (f ==  2)
      *result = proccnt();
    else if (f ==  3)
      *result = hasMMX();
    else if (f ==  4)
      *result = hasSSE();
    else if (f ==  5)
      *result = hasSSE2();
    else if (f ==  6)
      *result = hasSSE3();
    else if (f ==  7)
      *result = hasSSSE3();
    else if (f ==  8)
      *result = hasSSE41();
    else if (f ==  9)
      *result = hasSSE42();
    else if (f == 10)
      *result = hasPOPCNT();
    else if (f == 11)
      *result = hasAVX();
    else if (f == 12)
      *result = hasAVX2();
    else if (f == 13)
      *result = hasFMA3();
    else if (f == 14)
      *result = hasAVX512f();
    else if (f == 15)
      *result = hasAVX512cd();
    else if (f == 16)
      *result = hasAVX512bw();
    else if (f == 17)
      *result = hasAVX512dq();
    else if (f == 18)
      *result = hasAVX512vl();

}  // mexFunction()
