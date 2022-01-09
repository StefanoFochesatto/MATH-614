G =[0 0 1 0 0;
    1 0 1 1 0;
    1 1 0 0 1;
    1 0 0 0 0;
    0 0 0 1 0];

%Compute the columns sums
c = sum(G, 1);
%Repeat column sum so we can divide entrywise to compute A
C = repmat(c,5, 1);
%Set p and delta
p = .85;
delta = (1 - p)/5;
%Compute A 
A = (p.*G)./C + delta;

%Compute Eigenvalues and Eigenvectors of A
[V, D] = eig(A);
[M,I] = max(diag(D));
PageRank = V(:,I)/sum(V(:,I));

