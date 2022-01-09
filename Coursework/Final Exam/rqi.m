function [lam, v] = rqi(A, v0)
% This function takes a matrix A and vector v0
% and performs rayleigh quotient iteration to produce
% an eigenvector, eigenvalue pair. 

%Normalizing the input vector
v0 = v0./norm(v0);

%Initial rayleigh quotient iteration
lam = v0'*A*v0;

%Initializing count to display lambda values each iteration
count = 0;
    while (rcond(A - lam*eye(size(v0,1))) >= 10*eps) 
        %^^ Set threshold to exit iterative method
        %We exit the while loop when the reciprocal of the 
        %condition number for B is on the order of 10*eps. 
        
        %Displaying lambda value each iteration.
        disp(strcat(strcat('lambda', int2str(count)),':'))
        disp(lam)
        count = count + 1;
        
        %Using inverse iteration to get new v0
        v0 = (A - lam*eye(size(v0,1)))\v0;
        v0 = v0./norm(v0);
        
        %Using v0 to compute new rayleigh quotient
        lam = v0'*A*v0;
    end
    
v = v0;

end

