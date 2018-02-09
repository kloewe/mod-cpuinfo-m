function isSupported = hasIsaExtension(str)
%HASISAEXTENSION Determine support of ISA extensions on the CPU.
%
%   HASISAEXTENSION(E) returns 1 if the instruction set architecture (ISA)
%   extension E is supported by the CPU and 0 otherwise.
%
%   E can be one of the following strings:
%
%     'mmx'
%     'sse'
%     'sse2'
%     'sse3'
%     'ssse3'
%     'sse41'
%     'sse42'
%     'popcnt'
%     'avx'
%     'avx2'
%     'fma3'
%     'avx512f'
%     'avx512cd'
%     'avx512bw'
%     'avx512dq'
%     'avx512vl'
%
%   Example:
%
%     >> hasIsaExtension('avx')
%     ans =
%          1
%
%   See also: CORECNT, PROCCNT.
%
%   Author: Kristian Loewe

isaes = {'mmx', 'sse', 'sse2', 'sse3', 'ssse3', 'sse41', 'sse42', ...
  'popcnt', 'avx', 'avx2', 'fma3', 'avx512f', 'avx512cd', 'avx512bw', ...
  'avx512dq', 'avx512vl'};
f = int32(find(strcmp(str, isaes)) + 2);
assert(~isempty(f), 'Unknown ISA extension: %s', lower(str));

isSupported = logical(mxCpuinfo(f));
end
