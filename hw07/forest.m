function F=forest(x,y,nt)
% function F=forest(x,y,nt)
%
% INPUT:
% x | input vectors dxn
% y | input labels 1xn
%
% OUTPUT:
% F | Forest
%
[d, n] = size(x);

F = {};
for i=1:nt
	%select n with replacement
	all_index = (1:n);
	rand_index = randsample(all_index,n,replacement = true);
	xTr_rand = xTr(rand_index);
	yTr_rand = yTr(rand_index);
	F(i) = id3tree(xTr_rand,yTr_rand);
end
%% fill in code here