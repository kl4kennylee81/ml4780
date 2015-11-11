function ybar=computeybar(xTe)
% function [ybar]=ybar(xTe);
% 
% computes the expected label 'ybar' for a set of inputs x
% generated from two standard Normal distributions (one offset by OFFSET in
% both dimensions.)
%
% INPUT:
% xTe | a 2xn matrix of column input vectors
% 
% OUTPUT:
% ybar | a 1xn vector of the expected label ybare(x)
%

global OFFSET;

[~,n]=size(xTe);
ybar=zeros(1,n);

% Feel free to use the following function to compute p(x|y)
normpdf=@(x,mu,sigma)   exp(-0.5 * ((x - mu) ./ sigma).^2) ./ (sqrt(2*pi) .* sigma);

y1_mu = 0;
y1_sigma = 1;
y1_gaussian = normpdf(xTe, y1_mu, y1_sigma);

y2_mu = OFFSET;
y2_sigma = 1;
y2_gaussian = normpdf(xTe, y2_mu, y2_sigma);

p_x_given_y1 = prod(y1_gaussian, 1);
p_x_given_y2 = prod(y2_gaussian, 1);

ybar = 1*(p_x_given_y1 ./ (p_x_given_y2 + p_x_given_y1)) + 2*(p_x_given_y2 ./ (p_x_given_y2 + p_x_given_y1));



