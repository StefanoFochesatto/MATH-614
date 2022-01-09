function [v,u, U] = vismat(A)
% This function takes a 2x2 matrix A, 
% ans returns the svd visualization.


%%%%%%% ERROR CHECKING
DimensionCheck = size(A);
    if (DimensionCheck(1) ~= DimensionCheck(2))
        ||(DimensionCheck(1) + DimensionCheck(2) ~= 4) 
        error('A is Unexpected Size')
    end
    
[U, S, V] = svd(A);
Vstar = V';

%%%%%%% Plotting input space vectors v_1 and v_2
theta = 0:pi/50:2*pi;
xCircle = cos(theta);
yCircle = sin(theta);
plot(xCircle, yCircle, 'Color','red');
hold on
plot([Vstar(1,1) 0], [Vstar(2,1) 0], 'Color','red')
plot([Vstar(1,2), 0], [Vstar(2,2), 0], 'Color','red')


%%%%%%% Plotting output space vectors sigma_1u_1 and sigma_2u_2
%%%% Computing the matrix rotation
if U(1,1) > 0 
    alpha = -acos(dot(U(:,1), [0; 1])) + pi/2;
else
    alpha = pi/2 + acos(dot(U(:,1), [0; 1]));
end

%%%% Parameterizing the unit ellipse formed in the output space. 
xEllipse = S(1,1)*cos(theta)*cos(alpha) - S(2,2)*sin(theta)*sin(alpha);
yEllipse = S(1,1)*cos(theta)*sin(alpha) + S(2,2)*sin(theta)*cos(alpha);
plot(xEllipse, yEllipse, 'Color','blue');
hold on
plot([S(1,1)*U(1,1) 0], [S(1,1)*U(2,1) 0], 'Color','blue')
plot([S(2,2)*U(1,2) 0], [S(2,2)*U(2,2) 0], 'Color','blue')


v = Vstar;
u = U*S;
