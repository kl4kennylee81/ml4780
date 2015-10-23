function [loss,gradient]=ridge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%

% INPUT:
% w weight vector (default w=0)
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
%
% OUTPUTS:
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%
[d,n]=size(xTr);
sum_loss = (w.' * xTr) - yTr;
squared_sum_loss = sum_loss * sum_loss.';
loss = squared_sum_loss + lambda*(w.' * w);
gradient = (2*sum_loss*xTr.').' + 2*lambda*w;

