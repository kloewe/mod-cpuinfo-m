function tf = hasIsaExtension(isae)
%HASISAEXTENSION Determine support of ISA extensions on the CPU.
%
%   HASISAEXTENSION(E) returns 1 if the instruction set architecture (ISA)
%   extension E is supported by the CPU and 0 otherwise.
%
%   E can be one of the following strings:
%   'mmx', 'sse', 'sse2', 'sse3', 'ssse3', 'sse41', 'sse42', 'popcnt', 'avx'.
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

switch isae
  case 'mmx'
    tf = mxHasMmx;
  case 'sse'
    tf = mxHasSse;
  case 'sse2'
    tf = mxHasSse2;
  case 'sse3'
    tf = mxHasSse3;
  case 'ssse3'
    tf = mxHasSsse3;
  case 'sse41'
    tf = mxHasSse41;
  case 'sse42'
    tf = mxHasSse42;
  case 'popcnt'
    tf = mxHasPopcnt;
  case 'avx'
    tf = mxHasAvx;
  case 'fma3'
    tf = mxHasFma3;
  otherwise
    error('hasIsaExtension:checkArgs', 'Unknown extension.');
end

tf = logical(tf);

end
