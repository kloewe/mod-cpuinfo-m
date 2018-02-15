%TEST_CPUINFO
%
%   Requires the following modules:
%
%     cpuinfo-m
%
%   Author: Kristian Loewe

fprintf('%8s: %d\n', 'corecnt', corecnt());

fprintf('%8s: %d\n', 'proccnt', proccnt());

isaes = {'mmx', 'sse', 'sse2', 'sse3', 'ssse3', 'sse41', 'sse42', ...
  'popcnt', 'avx', 'avx2', 'fma3', 'avx512f', 'avx512cd', 'avx512bw', ...
  'avx512dq', 'avx512vl'};

for i = 1:numel(isaes)
  fprintf('%8s: %d\n', isaes{i}, hasIsaExtension(isaes{i}));
end
