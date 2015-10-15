function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5,tolerance=1e-02; end;

iterations = 0;
prevloss = 0;
prev_w = w0;
weightVector = w0;
stepsizeFactor = 1.01;

while (iterations < maxiter)

	[loss, gradient] = func(weightVector);

	if norm(gradient) < tolerance;
		break
	end;

	if loss > prevloss;
		stepsizeFactor = 0.5*stepsizeFactor;
		weightVector = prev_w;
		weightVector = weightVector + (-stepsize*stepsizeFactor)*gradient;
	else
		stepsizeFactor = 1.01*stepsizeFactor;
		prev_w = weightVector;
		weightVector = weightVector + (-stepsize*stepsizeFactor)*gradient;
	end;

	prevloss = loss;
	iterations++;

end;

w = weightVector;