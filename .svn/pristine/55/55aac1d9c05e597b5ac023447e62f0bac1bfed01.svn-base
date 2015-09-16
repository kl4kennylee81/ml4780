function [r,s]=hw0tests()
% function [r,s]=hw0tests()
%
% Tests the functions from homework assignment 0
% Please make sure that the error statements are instructive. 
%
% Output: 
% r=0 number of tests that broke
% s= statement describing the failed test (s={} if all succeed)
%


% Put in any seed below
rand('seed',31415926535);
% initial outputs
r=0;
s={};

WeakEps=sqrt(eps)*100;

% Test the inner-product function on a simple matrix
D=[1055    865    695    770    840
    865   1105    815    670    770
    695    815   1205    815    695
    770    670    815   1105    865
    840    770    695    865   1055];
if norm(innerproduct(magic(5))-D)>WeakEps,
    r=r+1;
	s{length(s)+1}='Innerproduct function inaccurate.'
end;	


% A simple test is to look if the diagonal is all zero
x=rand(10,100); 		% define some random test points
d=diag(l2distance(x));	% extract diagonal of distance matrix
if ~all(d<WeakEps)			% if test failed ...
	r=r+1;				% set output conditions and exit
	s{length(s)+1}='Distance from a vector to itself is not zero.';
end;


x=[[1,0];[0,1]];
z=[[0,0];[1,1]];
D=l2distance(x,z);
D2=[[sqrt(2),sqrt(2)];[0,0]];
if ~(max(max(abs(D2-D)))<WeakEps)
	r=r+1;				% set output conditions and exit
	s{length(s)+1}='Distances between xor vectors are not correct.';
end;

z=[1   0   0   1
   0   1   0   1];
x=[0;0];
D=l2distance(x,z);
D2=[1,1,0,sqrt(2.0)];
if ~(max(max(abs(D2-D)))<WeakEps)
    r=r+1;              % set output conditions and exit
    s{length(s)+1}='Distances between unit vectors are not correct.';
end;


D=[ 0    78    24
    78     0    78
    24    78     0];
if norm(l2distance(magic(3)).^2-D)>WeakEps,
    r=r+1;
	s{length(s)+1}='Distances inaccurate.'
end;	

x = [[1];[0]];
z = [[0];[1]];
D = l2distance(x,z);
D2 = sqrt(2);
if ~(abs(D2-D)<WeakEps)
    r=r+1;
    s{length(s)+1}='Distances between just 2 points is not correct.'
end;

%%>>kqw