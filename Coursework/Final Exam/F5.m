function b = inhousesolve(A, b)
% This function takes a square matrix A and a column vector b
% and solves A\b via inplace householder qr. 


%Error Checking 
[m, n] = size(A);
[brow, bcol] = size(b);
    if m ~= n  
        error('This function only accepts square Matrices')  
    end
    
    if (bcol ~= 1) || (brow ~= m)
        error('This function only a mx1 column vector')  
    end
    
    
%Inplace Computation of R and W
A = [A; zeros(1,m)];
    for k = 1:n
        %%%%%%%%%%%%%%%%% This Block is the same as house.m %%%%%%%%%%%%%%%%% 
        v = A(k:m,k); % v is (m-k+1) x 1 column vector
        v(1) = sign(v(1)) * norm(v,2) + v(1);
        v = v / norm(v,2);
        A(k:m,k:n) = A(k:m,k:n) - 2 * v * (v' * A(k:m,k:n));
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        A(k+1:m+1,k) = v;% store v in A
    end
    
    
%Linear Solve by only referencing A
%Forming Q^*b in place of b
    for k = 1:m
        b(k:m,:) =  b(k:m,:) - 2*A(k+1:m+1,k)*(A(k+1:m+1,k)'* b(k:m,:));
    end
    
%Solving for Rx = Q^*b via in place backsubstitution. 
b(m,1) = b(m,1) / A(m,m);
    for i = m-1:-1:1
      b(i,1) = (b(i,1) - A(i,i+1:m) * b(i+1:m,1) ) / A(i,i);
    end

end