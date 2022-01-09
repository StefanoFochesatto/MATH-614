
%Choose which plot to display 
ChoosePlot = 4;
%Choosing the Number of Vectors used to plot each norm
N = 50;
%Quick way of initilizing a mesh 
[X, Y, Z] = sphere(N);

if ChoosePlot == 1
%%%%%%%%%%%%%%%%%%% Computing the one-Norm
    f1Norm = @(x, y, z) abs(x) + abs(y) + abs(z); 

    Magnitude = f1Norm(X,Y,Z);
    xnorm =  X./Magnitude;
    ynorm =  Y./Magnitude;
    znorm =  Z./Magnitude;

    h = mesh(xnorm, ynorm, znorm);
    light('Position',[-1 0 .9],'Style','infinite')
    h.FaceLighting = 'gouraud';
    h.EdgeColor = 'none';
    h.FaceColor = 'cyan';
    h.SpecularStrength = 0.9;


    
elseif ChoosePlot == 2
%%%%%%%%%%%%%%%%%%% Computing the Inf-Norm
    x1 = abs(reshape(X, [1 (N+1)^2]));
    x2 = abs(reshape(Y, [1 (N+1)^2]));
    x3 = abs(reshape(Z, [1 (N+1)^2]));

    Magnitude = max([x1; x2; x3]);
    Magnitude = reshape(Magnitude, [(N+1) (N+1)]);

    xnorm =  X./Magnitude;
    ynorm =  Y./Magnitude;
    znorm =  Z./Magnitude;

    h = mesh(xnorm, ynorm, znorm);
    light('Position',[-1 0 .9],'Style','infinite')
    h.FaceLighting = 'gouraud';
    h.EdgeColor = 'none';
    h.FaceColor = 'cyan';
    h.SpecularStrength = 0.9;
    xlim([-2 2])
    ylim([-2 2])
    zlim([-2 2])




elseif ChoosePlot == 3
%%%%%%%%%%%%%%%%%%% Computing the two-Norm
    f2Norm = @(x, y, z) sqrt(abs(x).^2 + abs(y).^2 + abs(z).^2); 

    Magnitude = f2Norm(X,Y,Z);
    xnorm =  X./Magnitude;
    ynorm =  Y./Magnitude;
    znorm =  Z./Magnitude;

    h = mesh(xnorm, ynorm, znorm);
    light('Position',[-1 1 1],'Style','infinite')
    h.FaceLighting = 'gouraud';
    h.EdgeColor = 'none';
    h.FaceColor = 'cyan';
    h.SpecularStrength = 0.9;
    xlim([-2 2])
    ylim([-2 2])
    zlim([-2 2])



else
%%%%%%%%%%%%%%%%%%% Computing the 4-Norm
    f1Norm = @(x, y, z) sqrt(sqrt(abs(x).^4 + abs(y).^4 + abs(z).^4)); 

    Magnitude = f1Norm(X,Y,Z);
    xnorm =  X./Magnitude;
    ynorm =  Y./Magnitude;
    znorm =  Z./Magnitude;

    h = mesh(xnorm, ynorm, znorm);
    light('Position',[-1 1 1],'Style','infinite')
    h.FaceLighting = 'gouraud';
    h.EdgeColor = 'none';
    h.FaceColor = 'cyan';
    h.SpecularStrength = 0.9;

    xlim([-2 2])
    ylim([-2 2])
    zlim([-2 2])
end

