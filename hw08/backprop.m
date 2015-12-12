function  gradient = backprop(W, as,zs, yTr,  der_trans_func)
% function [gradient] = backprop(W, as, zs, yTr,  der_trans_func)
%
% INPUT:
% W weights (cell array)
% as output of forward pass (cell array)
% zs output of forward pass (cell array)
% yTr 1xn matrix (each entry is a label)
% der_trans_func derivative of transition function to apply for inner layers
%
% OUTPUTS:
% 
% gradient = the gradient at w as a cell array of matrices
%

n=length(yTr);
delta=zs{1}-yTr;
% compute gradient with back-prop
gradient = cell(size(W));

% [delta1, delta2] = size(delta) % 1 x n
% [temp1, temp2] = size(as{1}) % 1 x n
% temp = as{1};
% [trans1, trans2] = size(der_trans_func(temp)) % 1 x n

lower_delt = delta .* as{1};
% [nice1, nice2] = size(der_trans_func(as{1}))

 for i=1:length(W)
	% INSERT CODE HERE:
	% [delt1, delt2] = size(lower_delt)
	% [z1, z2] = size(zs{i})
	% [next1, next2] = size(zs{i+1})

	gradient{i} = (lower_delt * (zs{i+1}).') ./ n;
	% [grad1, grad2] = size(gradient{i})
	w_t_delta = W{i}.' * lower_delt;
	w_t_delta = w_t_delta(1:size(w_t_delta,1)-1, :);	

	lower_delt = der_trans_func(as{i+1}) .* w_t_delta;  % 12 x 10
end;


