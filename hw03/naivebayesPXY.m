function [posprob,negprob] = naivebayesPXY(x,y)
% function [posprob,negprob] = naivebayesPXY(x,y);
%
% Computation of P(X|Y)
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1) (1xn)
%
% Output:
% posprob: probability vector of p(x|y=1) (dx1)
% negprob: probability vector of p(x|y=-1) (dx1)
%

% add one all-ones positive and negative example
[d,n]=size(x);
x=[x ones(d,2)];
y=[y -1 1];

[d,n] = size(x);

matrix_with_labels = x .* repmat(y,d,1);

pos_cols = x(:,y==1);
pos_denominator = sum(pos_cols(:));

pos_feature_vector = sum(matrix_with_labels==1,2);
posprob = pos_feature_vector./pos_denominator;

neg_cols = x(:,y==-1);
neg_denominator = sum(neg_cols(:));

neg_feature_vector = sum(matrix_with_labels==-1,2);
negprob = neg_feature_vector./neg_denominator;

