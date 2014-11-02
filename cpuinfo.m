function hasFeature = cpuinfo(feature)
%CPUINFO Determine availability of instruction set extensions on the CPU.
%
%   hasFeature = CPUINFO('feature') returns 1 if the feature 'feature'
%   is supported by the CPU and 0 otherwise.
%
%   The following features can be checked:
%   mmx, sse, sse2, sse3, ssse3, sse41, sse42, popcnt, avx.
%
%   Example:
%   hasFeature = cpuinfo('avx');
%
%   See also: NPROC.
%
%   File:   cpuinfo.m
%   Author: Kristian Loewe

switch feature
  case 'mmx'
    hasFeature = mxHasMmx;
  case 'sse'
    hasFeature = mxHasSse;
  case 'sse2'
    hasFeature = mxHasSse2;
  case 'sse3'
    hasFeature = mxHasSse3;
  case 'ssse3'
    hasFeature = mxHasSsse3;
  case 'sse41'
    hasFeature = mxHasSse41;
  case 'sse42'
    hasFeature = mxHasSse42;
  case 'popcnt'
    hasFeature = mxHasPopcnt;
  case 'avx'
    hasFeature = mxHasAvx;
  otherwise
    error('hasFeature:checkArgs','Unknown feature.');
end
hasFeature = logical(hasFeature);

end