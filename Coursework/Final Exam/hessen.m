function A = hessen(A, stages)
% This function takes a square matrix A and 
% a bool, stages and reduces the matrix A to 
% Hessenberg form via algorithm 26.1. The function will display 
% each stage of the algorithm when stages is set to true.

% Error Checking
[m, n] = size(A);
    if m ~= n  
        error('This function only accepts square Matrices')  
    end
    
 
% Reduction to Hessenberg Form
    for k = 1:m-2
        if (stages == true) % Display stages
            disp(strcat('This is stage:', int2str(k)))
            disp(A)
        end
        v = A(k+1:m,k);
        v(1) = sign(v(1)) * norm(v,2) + v(1);
        v = v / norm(v,2);
        A(k+1:m, k:m) =  A(k+1:m, k:m) - 2*v*(v'* A(k+1:m, k:m));
        A(1:m,k+1:m) =  A(1:m,k+1:m) - 2*(A(1:m,k+1:m)*v)*v';
    end
    
    if (stages == true) % Display stages
        disp(strcat('This is stage:', int2str(m-1)))
        disp(A)
    end
end
