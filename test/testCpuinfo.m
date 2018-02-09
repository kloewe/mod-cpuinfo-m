

fprintf('%s: %s\n', 'corecnt', which('corecnt'));
fprintf('%s: %s\n', 'proccnt', which('proccnt'));
fprintf('%s: %s\n', 'hasIsaExtension', which('hasIsaExtension'));

fprintf('%8s: %d\n', 'corecnt', corecnt());

fprintf('%8s: %d\n', 'proccnt', proccnt());

isaes = {'mmx', 'sse', 'sse2', 'sse3', 'ssse3', 'sse41', 'sse42', ...
  'popcnt', 'avx', 'avx2', 'fma3', 'avx512f', 'avx512cd', 'avx512bw', ...
  'avx512dq', 'avx512vl'};

for i = 1:numel(isaes)
  fprintf('%8s: %d\n', isaes{i}, hasIsaExtension(isaes{i}));
end
