function [H,q,A,b,lb,ub]=generateQP(K,yTr,C);
% function [H,q,A,b,lb,ub]=generateQP(K,yTr,C);
%
% INPUT:	
% K : nxn kernel matrix
% yTr : 1xn input labels
% C : regularization constant
% 
% Output:
% H,q,A,b,lb,ub as defined in the Octave function 'qp'
%
% A call of qp(alpha0, H, q, A, b, lb, ub); should return the solution of the SVM specified by K,yTr,C
% for any valid alpha0 initialization.
%

[d,n]=size(K);
assert(d==n);

% YOUR CODE
lb = zeros(n,1);
ub = repmat(C, n, 1);


yTr = yTr.';
horizontal_y = repmat(yTr, n, 1);
vertical_y = repmat(yTr.',1,n);
H = (horizontal_y .* K) .* vertical_y;
q = ones(n,1);
b = 0;
A = yTr;