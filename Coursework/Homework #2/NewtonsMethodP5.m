function [Hist, xfinal] = NewtonsMethodP5(f1,f2,f3,xnot,n)
%This function takes the three surfaces from P5a f1,f2,and f3
%an initial iterate xnot, and the number of Newton Methed
%iterations n. Symbolic Math Toolbox is required

%Initializing symbolic variables and history
syms x y z 
Hist = [xnot];

%Initializing vector functions
NonLinearSystem = [f1;f2;f3];
Jacobian = jacobian(NonLinearSystem,[x y z]);

    for i = 1:n
        %Computing jacobian for current iterate
        J = double(subs(Jacobian,[x y z],xnot));
        %Computing vector function value for current iterate
        f = -1*double(subs(NonLinearSystem,[x y z],xnot));
        %Solving for s
        s = J\f;
    
        %Newton Step
        xx = xnot + s';
        Hist = [Hist; xx];
        %Computed vector becomes next iterate
        xnot = xx;
    end
%Setting Final
xfinal = xnot;
end