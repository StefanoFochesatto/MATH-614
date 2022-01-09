function [Count,x] = MatVec(A,v)
% This function takes a matrix A and a vector v
% and returns the product Av and the # of FLOPs.

if size(A,2) ~= size(v)
    error('Dimension Mismatch')
end


Count = 0; %Init Count
x = zeros(size(A,1),1);

    for m = 1:size(A,1) %Traverses Rows of A
        sum = 0;
        Count = Count-1; % Adjustment for initial addition   

            for n = 1:size(v,1)% Traverses vector v
                sum = sum + A(m,n)*v(n);
                Count = Count + 2; % 1 multiplication and 1 addition 
            end
            
        x(m) = sum;
    end
end

