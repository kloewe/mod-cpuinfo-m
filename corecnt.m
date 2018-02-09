function n = corecnt
%CORECNT Determine the number of processor cores.
%
%   CORECNT returns the number of processor cores.
%
%   Example:
%
%     >> corecnt
%     ans =
%          4
%
%     >> proccnt
%     ans =
%          8
%
%   See also: PROCCNT, HASISAEXTENSION.
%
%   Author: Kristian Loewe

n = double(mxCpuinfo(int32(1)));

end
