function w = perceptronUpdate(x,y,w)
% function w=perceptronUpdate(x,y,w);
%
% Implementation of Perceptron weights updating
% Input:
% x : input vector of d dimensions (dx1)
% y : corresponding label (-1 or +1)
% w : weight vector before updating
%
% Output:
% w : weight vector after updating
%

d = size(x,1);
guess = w.'*x;
if (y*guess <= 0)
	w = w + y*x;
end


