function n = proccnt
%PROCCNT Determine the number of logical processors.
%
%   PROCCNT returns the number of logical processors.
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
%   See also: CORECNT, HASISAEXTENSION.
%
%   Author: Kristian Loewe

n = double(mxCpuinfo(int32(2)));

end
