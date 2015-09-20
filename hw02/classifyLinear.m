function preds = classifyLinear(x,w,b);
% function preds=classifyLinear(x,w,b);
%
% Make predictions with a linear classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% w : weight vector (dx1)
% b : bias (scalar)
%
% Output:
% preds: predictions (1xn)
%

% if no bias is given, set it to zero
if nargin<3,
	b=0;
end;
[d,n] = size(x);
w_bias = [w;b];
x_with_ones = [x;ones(1,n)];
preds = sign(w_bias.'*x_with_ones);


