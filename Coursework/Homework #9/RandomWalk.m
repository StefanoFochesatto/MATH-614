function [PageRank, Walk, count] = RandomWalk(G, WalkLength)
n = size(G, 1);
Walk = zeros(1, WalkLength);
count = zeros(1, n);

%Randomly choose starting node
Walk(1) = ceil(n*rand(1));
%Update node count
count(Walk(1)) = count(Walk(1)) + 1 ;

for i = 2:WalkLength
    
    %Add current node to possible paths
    PossiblePaths = [];
    CrossRoad = G(:, Walk(i - 1));
    
    %Iterate through CrossRoad, adding index to PossiblePaths
    for j = 1:n
        if CrossRoad(j) == 1
            %Add all nodes incident to current node
            PossiblePaths = [PossiblePaths j];
        end 
    end
    
    
    %Compute deltaFactor
    deltaFactor = rand(1);
    if deltaFactor >= .85
            NextNode = ceil(n*rand(1));
        else
        %Sample from possible paths
        NextNode = randsample(PossiblePaths, 1);
    end
    
    
    
    %Update Walk and count
    Walk(i) = NextNode;
    count(Walk(i)) = count(Walk(i)) + 1 ;
end
%Compute Propotions
PageRank = count./WalkLength;
end

