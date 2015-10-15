function [loss,gradient]=logistic(w,xTr,yTr)
% function w=logistic(w,xTr,yTr)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% w weight vector (default w=0)
%
% OUTPUTS:
% 
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);
loss = log(1+exp(-yTr*xTr.'*w));
gradient_numerator = -xTr*yTr.'*exp(-yTr*xTr.'*w);
gradient_denominator = (1+exp(-yTr*xTr.'*w));
gradient = gradient_numerator/gradient_denominator;
