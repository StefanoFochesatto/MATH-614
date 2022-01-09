using LinearAlgebra
using Random

function randproj(m,k)
#This function takes a dimension m, and a rank k
#and produces an orthogonal projector P, on a k
#dimension subspace of m
    A = randn(m,m);
    (Q, R)= qr(A)
    P = Q[:,1:k]*Q[:,1:k]'
    return P
end


