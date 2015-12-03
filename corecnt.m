function n = corecnt
%CORECNT Determine the number of processor cores.
%
%   n = CORECNT returns the number of processor cores.
%
%   See also: PROCCNT, CPUINFO.
%
%   File:   corecnt.m
%   Author: Kristian Loewe

n = double(mxCorecnt());

end
