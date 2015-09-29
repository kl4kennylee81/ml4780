function [poscond, negcond] = naivebayes(x,y,x1)
% function possi = naivebayes(x,y);
%
% Computation of log P(Y|X=x1) using Bayes Rule
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
% x1: input vector of d dimensions (dx1)
%
% Output:
% poscond: log conditional probability log P(Y = 1|X=x1)
% negcond: log conditional probability log P(Y = -1|X=x1)
%

[d,n] = size(x);

[py_pos,py_neg] = naivebayesPY(x,y);
[posprob,negprob] = naivebayesPXY(x,y)

x1_pos_vector = posprob(x1>0) .^ x1(x1>0)
x1_pos_log = log(x1_pos_vector);
x1_pos_PXY = sum(x1_pos_log,1);
poscond =  x1_pos_PXY + log(py_pos);



x1_neg_vector = negprob(x1>0).^ x1(x1>0);
x1_neg_log = log(x1_neg_vector);
x1_neg_PXY = sum(x1_neg_log,1);
negcond = x1_neg_PXY + log(py_neg);



