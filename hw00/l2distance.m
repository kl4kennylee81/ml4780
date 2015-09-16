function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
%
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

if (nargin==1) % case when there is only one input (X)
	%% fill in code here
  n = columns(X);
  m = columns(X);
  
  % making G
  G = innerproduct(X,X);

  % making S
  diag_vector_i = sum(X.*X,1).';
  %S = repmat(diag_vector_i,1,m);
  S = diag_vector_i(:,ones(1,m));

  % making R
  diag_vector_j = diag_vector_i.';
  %R = repmat(diag_vector_j,n,1);
  R = diag_vector_j(ones(n,1),:);

else  % case when there are two inputs (X,Z)
	%% fill in code here
  n = columns(X);
  m = columns(Z);

  % making G
  G = innerproduct(X,Z);

  % making S
  diag_vector_i = sum(X.*X,1).';
  %S = repmat(diag_vector_i,1,m);
  S = diag_vector_i(:,ones(1,m));

  % making R
  diag_vector_j = sum(Z.*Z,1);
  % R = repmat(diag_vector_j,n,1);
  R = diag_vector_j(ones(n,1),:);

end;

D_squared = S - 2.*G + R;
D = sqrt(abs(D_squared));
