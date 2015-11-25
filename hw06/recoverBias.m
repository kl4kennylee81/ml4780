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

a_y = yTr.' .* alphas; % a_Y is nx1
I = find(alphas>0 & alphas<C);
random_index = I(1);
y_i = yTr(random_index);
K_J = K(:,random_index); % K_J is nx1
inner = a_y.' * K_J;
yterm = y_i*inner;
bias = (1-yterm)/y_i;


% YOUR CODE 

