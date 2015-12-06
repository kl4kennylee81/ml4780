function T=id3tree(xTr,yTr,maxdepth,weights)
% function T=id3tree(xTr,yTr,maxdepth,weights)
%
% The maximum tree depth is defined by "maxdepth" (maxdepth=2 means one split).
% Each example can be weighted with "weights".
%
% Builds an id3 tree
%
% Input:
% xTr | dxn input matrix with n column-vectors of dimensionality d
% yTr | 1xn input matrix
% maxdepth = maximum tree depth
% weights = 1xn vector where weights(i) is the weight of example i
%
% Output:
% T = decision tree
%

%% fill in code here
% 1. prediction at this node
% 2. index of feature to cut
% 3. cutoff value c (<=c : left, and >c : right)
% 4. index of left subtree (0 = leaf)
% 5. index of right subtree (0 = leaf)
% 6. parent (0 = root)

% 2^maxdepth-1 qs
[d,n] = size(xTr);

if nargin<3,
  maxdepth=d+1;
  total_nodes = 2^(maxdepth)-1;
else
  total_nodes = 2^maxdepth-1;
end;

if nargin<4,
  weights=ones(1,n)./n;
end;


T = zeros(6,total_nodes);
% xTr_treeIndex = ones(1,n);
% d_treeIndex = ones(d,total_nodes);
function size_end = create_tree(id,xTr,yTr,depth,parent,d_index_list)
% call on left
% call on right
if all(yTr == yTr(1)),
  %1 prediction
  T(1,id) = yTr(1);
  if parent > id
    size_end = parent;
  else
    size_end = id;
  end
% base case no more features
elseif isempty(xTr),
  T(1,id) = mode(yTr);
  if parent > id
    size_end = parent;
  else
    size_end = id;
  end
elseif depth == maxdepth,
  T(1,id) = mode(yTr);
  if parent > id
    size_end = parent;
  else
    size_end = id;
  end
elseif id > total_nodes
  size_end = parent;
else
  [feature,cut,Hbest]=entropysplit(xTr,yTr,weights);
  if (feature == 0)
    T(1,id) = mode(yTr);
    if parent > id
      size_end = parent;
    else
      size_end = id;
    end
  else
    f_xTr = xTr(feature,:);
    left_indexs = find(f_xTr<=cut);
    right_indexs = find(f_xTr>cut);

    %create the tree node
    index_child1 = 2*id;
    index_child2 = 2*id+1;

    T(1,id) = mode(yTr);
    T(2,id) = d_index_list(feature);
    T(3,id) = cut;
    T(4,id) = index_child1;
    T(5,id) = index_child2;
    T(6,index_child1) = id;
    T(6,index_child2) = id;

    % abridge for recursive call
    removed_feature = d_index_list(1:end ~= feature);

    xTr_i_removed = xTr(1:end ~= feature,:);
    left_xTr = xTr_i_removed(:,left_indexs);
    right_xTr = xTr_i_removed(:,right_indexs);

    left_yTr = yTr(left_indexs);
    right_yTr = yTr(right_indexs);
    sizeleft = create_tree(index_child1,left_xTr,left_yTr,depth+1,id,removed_feature);
    sizeright = create_tree(index_child2,right_xTr,right_yTr,depth+1,id,removed_feature);
    size_end = max(sizeleft,sizeright);
  end;
end;
end;
total_d_index = [1:d];
total_size = create_tree(1,xTr,yTr,1,0,total_d_index);
T = T(:, 1:total_size);
end;
