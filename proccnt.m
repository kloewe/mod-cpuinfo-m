function n = proccnt
%PROCCNT Determine the number of logical processors.
%
%   n = PROCCNT returns the number of logical processors.
%
%   See also: CORECNT, CPUINFO.
%
%   File:   proccnt.m
%   Author: Kristian Loewe

n = double(mxProccnt());

end
