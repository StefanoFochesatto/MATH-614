%Initialize A
A = [2  3  5 -1;
    -1  7  3  5;
    -1 -1  2  4];

%Compute SVD
[U, S, V] = svd(A);

%Initialize Matrix B
B = zeros(3,4);

%Populate B with 2nd partial sum of A's Rank-One Decomposition. 
for i = 1:2
    B = B + S(i,i)*U(:,i)*V(:,i)';
end

% B =
%     1.8390    3.9718    3.9798   -1.3639
%    -0.8435    6.0554    3.9916    5.3537
%    -1.3234    0.9525   -0.0498    3.2689

