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

% e_component = exp(-yTr.*(w.'*xTr));
% loss = sum(log(1+e_component));
% e2 = exp(-yTr*(xTr.'*w));
% ratio = e_component / (1+e_component)
% disp("hi")
% ratio2 = (e2) / (1+e2)
% gradient = (-xTr*yTr.') .* ratio;
% loss2 = log(1 + exp(-yTr * xTr.'*w))



e_term = exp(-yTr .* (w.'*xTr));
loss = sum(log((1 + e_term)));

e_term2 = ((-yTr .* e_term) ./ (1+e_term));
Z = xTr * e_term2.';
gradient = sum(Z,2);

% gradient = ((-xTr * yTr.')) * sum() / (1 + e_term);



% gradient_numerator = -xTr*yTr.'*exp(-yTr*xTr.'*w);
% gradient_denominator = (1+exp(-yTr*xTr.'*w));
% gradient = gradient_numerator/gradient_denominator;


% gradient_numerator = -xTr*yTr.'*exp(-yTr*xTr.'*w);
% gradient_denominator = (1+exp(-yTr*xTr.'*w));
% gradient = gradient_numerator/(gradient_denominator*log(10));