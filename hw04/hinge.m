function [loss,gradient]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);
loss = 0;
gradient = rand(d,1);


loss_sum = 0;

for i = 1:n	
	loss_sum = loss_sum + max( 1 - (yTr(i)*(w.'*xTr(:,i)) ),0 );
end

loss = loss_sum + lambda*w.'*w;


gradient_loss_sum = 0;

for i = 1:n
	val = yTr(i) * (w.'*xTr(:,i));

	if val < 1
		gradient_loss_sum = gradient_loss_sum + (-yTr(i)) * xTr(:,i)
	end
end

gradient = gradient_loss_sum + 2*lambda*w






