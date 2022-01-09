%Set the number of nodes
n = 10;
%Generate Random G
G = round(.70*rand(n, n));
%Plot W, input is G' because of digraph()
W = digraph(G');
plot(W, 'Layout','force')

%Compute the column sums
c = sum(G, 1);
%Repeat column sum so we can divide entrywise to compute A
C = repmat(c,n, 1);
%Set p and delta
p = .85;
delta = (1 - p)/n;
%Compute A
A = (p.*G)./C + delta;

%Compute Eigenvalues and Eigenvectors of A
[V, D] = eig(A);
[M,I] = max(diag(D));
PageRank = V(:,I)/sum(V(:,I));

%ExtraCredit Function call
[RandomPageRank, randomWalk, NodeCounts] = RandomWalk(J, 100000);
