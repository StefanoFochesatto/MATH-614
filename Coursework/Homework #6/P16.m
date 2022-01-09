function [C] = P14(A)
%This function takes a tall matrix A
%and returns a storage array C that contains the 
%Unitary matrices used to perform householder QR


%Pulling dimensions and initializing storage array. 
[m,n] = size(A);
C = {1, n};

    for i = 1:n
        %Computing v.
        x = A(i:m, i); 
        v = (norm(x)*eye(m+1-i,1))-x;
        %Computing F.
        F = eye(m+1-i, m+1-i) - 2*((v*v')/(v'*v));
        %Form Q_i.
        Q = eye(m,m);
        Q(i:m, i:m) = F;
        %Store Q_i.
        C{1,i} = Q;
        %Apply Q_i to rest of matrix for the next step. 
        A = Q*A;
    end
end