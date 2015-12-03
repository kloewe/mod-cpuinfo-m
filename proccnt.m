function n = proccnt
%NPROC Determine the number of logical processors.
%
%   n = PROCCNT returns the number of logical processors.
%
%   See also: CPUINFO.
%
%   File:   proccnt.m
%   Author: Kristian Loewe

n = double(mxProccnt());

end
