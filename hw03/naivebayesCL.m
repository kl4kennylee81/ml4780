function [w,b]=naivebayesCL(x,y);
% function [w,b]=naivebayesCL(x,y);
%
% Implementation of a Naive Bayes classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
% b : bias (scalar)
%

[d,n]=size(x);
[posprob,negprob] = naivebayesPXY(x,y);
[pos_y,neg_y] = naivebayesPY(x,y);
w = log(posprob) - log(negprob);
b = log(pos_y) - log(neg_y);





