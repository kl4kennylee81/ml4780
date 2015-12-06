% Copyright (C) 2013 Fernando Damian Nieuwveldt <fdnieuwveldt@gmail.com>
%
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; either version 3
% of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License along with
% this program; if not, see <http://www.gnu.org/licenses/>.

% -*- texinfo -*-
% @deftypefn {Function File} {[@var{COEFF}]} = pcacov(@var{X})
% @deftypefnx {Function File} {[@var{COEFF},@var{latent}]} = pcacov(@var{X})
% @deftypefnx {Function File} {[@var{COEFF},@var{latent},@var{explained}]} = pcacov(@var{X})
% @itemize @bullet
% @item
% pcacov performs principal component analysis on the nxn covariance matrix X
% @item
% @var{COEFF} : a nxn matrix with columns containing the principal component coefficients
% @item
% @var{latent} : a vector containing the principal component variances
% @item
% @var{explained} : a vector containing the percentage of the total variance explained by each principal component
%
% @end itemize
%
% @subheading References
%
% @enumerate
% @item
% Jolliffe, I. T., Principal Component Analysis, 2nd Edition, Springer, 2002
% 
% @end enumerate
% @end deftypefn

% Author: Fernando Damian Nieuwveldt <fdnieuwveldt@gmail.com>
% Description:  Principal Components Analysis using a covariance matrix
function [COEFF, latent, explained] = pcacov(X)

  [U,S,V] = svd(X);

  if nargout == 1
    COEFF     = U;
  elseif nargout == 2
    COEFF     = U;
    latent    = diag(S);
  else
    COEFF     = U;
    latent    = diag(S);
    explained = 100*latent./sum(latent);
  end
