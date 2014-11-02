function n = nproc
%NPROC Determine the number of processing units available.
%
%   n = NPROC returns the number of available processing units.
%
%   See also: CPUINFO.
%
%   File:   nproc.m
%   Author: Kristian Loewe

n = double(mxNProc());

end
