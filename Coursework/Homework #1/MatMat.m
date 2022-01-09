function [Count, x] = MatMat(A,v)
% This function takes a matrix A and another matrix v
% and returns the product Av and the # of FLOPs.

if size(A,2) ~= size(v,1)
    error('Dimension Mismatch')
end

Count = 0; %Init Count
x = zeros(size(A,1),size(v,2));

   for k = 1:size(v,2) %Traverses Columns of V
  
       for m = 1:size(A,1) %Traverses Rows of A
            sum = 0;
            Count = Count-1; % Adjustment for initial addition
       
         for n = 1:size(v,1)% Traverses vector v
             sum = sum + A(m,n)*v(n,k);
             Count = Count + 2; % 1 multiplication and 1 addition
        
         end   
         x(m,k) = sum;
      end 
   end
end

