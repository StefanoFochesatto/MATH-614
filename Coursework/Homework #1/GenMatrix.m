StoreMatrix = {}; %Initilize Storage Cell

%%%%%%%%%%%%%%%%%%%%%%%%%% Generating Data
for i = 1:8
    
    %Initilizing individual data storage cells
    MatrixVec = {};
    NormVec = {};
    RankVec = {};
    DetVec = {};
    
    %Generating Matrices and Computing data
    for k = 1:10
        j = 20.*rand(2^i)-10; %Generate 2^ix2^i matrix
        
        % Data Computation and Storage to individual cells
        MatrixVec{1,k} = j;
        RankVec{1,k} = rank(j);
        NormVec{1,k} = norm(j);
        DetVec{1,k} = abs(det(j));
    end
        
        %Saving generated matrices
        StoreMatrix{i,1} = MatrixVec;
        %Saving the ranks
        StoreMatrix{i, 2} =RankVec;
        %Saving the 2-norms
        StoreMatrix{i, 3} = NormVec;
        %Saving the determinants
        StoreMatrix{i, 4} = DetVec;
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%% Plotting Data

%Converting storage cells to plotable vectors
DegreeData = cell2mat([StoreMatrix{:,2}]);
NormData = cell2mat([StoreMatrix{:,3}]);
DetData = cell2mat([StoreMatrix{:,4}]);


tiledlayout(1,3)
ax1 = nexttile;
semilogy(ax1,DegreeData, NormData, 'o')
title(ax1,'Dimension/Rank vs Norm (plot)')
xlabel(ax1,'Dimension')
ylabel(ax1,'Norm')
grid on

ax2 = nexttile;
semilogy(ax2,DegreeData, DetData, 'o')
title(ax2,'Dimension/Rank vs Determinant (semilogy)')
xlabel(ax2,'Dimension')
ylabel(ax2,'Determinant')
grid on 

ax3 = nexttile;
loglog(ax3,NormData, DetData, 'o')
title(ax3,'Norm vs Determinant (loglog)')
xlabel(ax3,'Norm')
ylabel(ax3,'Determinant')
grid on