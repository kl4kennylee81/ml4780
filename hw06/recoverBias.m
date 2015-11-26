function bias=recoverBias(K,yTr,alphas,C);
% function bias=recoverBias(K,yTr,alphas,C);
%
% INPUT:	
% K : nxn kernel matrix
% yTr : 1xn input labels
% alphas  : nx1 vector or alpha values
% C : regularization constant
% 
% Output:
% bias : the hyperplane bias of the kernel SVM specified by alphas
%
% Solves for the hyperplane bias term, which is uniquely specified by the support vectors with alpha values
% 0<alpha<C
%

yTr = yTr.';

a_y = yTr.' .* alphas; % a_Y is nx1
I = find(alphas>0 & alphas<C);
possible_alphas = sort(alphas(I));
[n,m] = size(possible_alphas);
median_val = possible_alphas(ceil(n/2));
median_index = find(alphas==median_val)(1);
y_i = yTr(median_index);
K_J = K(:,median_index); % K_J is nx1
inner = a_y.' * K_J;
yterm = y_i*inner;
bias = (1-yterm)/y_i;


% YOUR CODE 

