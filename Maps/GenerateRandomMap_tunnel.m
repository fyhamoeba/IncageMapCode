function empty_map = GenerateRandomMap_tunnel
global startTile pstartTile;
global ghostNumber;
global map_rand;
global deadline; deadline = 60*3600;
% dot_percentage = 0.7;
map_rand = rand;  % defines map type
ghostNumber = 1;

%%
if map_rand >1

empty_map = [ ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '________||||||||||||________' ...
    '________|          |________' ...
    '________| |||||||| |________' ...
    '________| |||||||| |________' ...
    '________| |||||||| |________' ...
    '||||||||| |||||||| |||||||||' ...
    '|||||||||          |||||||||' ...
    '||||||||| |||--||| |||||||||' ...
    '||||||||| |______| |||||||||' ...
    ' .....    ||||||||    ..... ' ...
    '||||||||| |||||||| |||||||||' ...
    '||||||||| |||||||| |||||||||' ...
    '________| |||||||| |________' ...
    '________|          |________' ...
    '________||||||||||||________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________'];


startTile(:,1:2) = [14 15;17 18];
pstartTile = struct('x',10,'y',15);

elseif map_rand >=0.5

empty_map = [ ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '________||||||||||||________' ...
    '________|   ...    |________' ...
    '________| |||||||| |________' ...
    '________| |||||||| |________' ...
    '________| |||||||| |________' ...
    '||||||||| |||||||| |||||||||' ...
    '|||||||||          |||||||||' ...
    '||||||||| |||--||| |||||||||' ...
    '||||||||| |______| |||||||||' ...
    '          ||||||||  .....o  ' ...
    '||||||||| |||||||| |||||||||' ...
    '||||||||| |||||||| |||||||||' ...
    '________| |||||||| |________' ...
    '________|          |________' ...
    '________||||||||||||________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________'];


startTile(:,1:2) = [14 15;17 18];
pstartTile = struct('x',10,'y',15);


elseif map_rand >=0
    
empty_map = [ ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '________||||||||||||________' ...
    '________|          |________' ...
    '________| |||||||| |________' ...
    '________| |||||||| |________' ...
    '________| |||||||| |________' ...
    '||||||||| |||||||| |||||||||' ...
    '|||||||||          |||||||||' ...
    '||||||||| |||--||| |||||||||' ...
    '||||||||| |______| |||||||||' ...
    '  o.....  ||||||||          ' ...
    '||||||||| |||||||| |||||||||' ...
    '||||||||| |||||||| |||||||||' ...
    '________| |||||||| |________' ...
    '________|   ...    |________' ...
    '________||||||||||||________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________'];


startTile(:,1:2) = [14 15;17 18];
pstartTile = struct('x',19,'y',15);

else 
    
empty_map = [ ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '________||||||||||||________' ...
    '________|          |________' ...
    '________| |||||||| |________' ...
    '________| |||||||| |________' ...
    '________| |||||||| |________' ...
    '||||||||| |||||||| |||||||||' ...
    '|||||||||          |||||||||' ...
    '||||||||| |||--||| |||||||||' ...
    '||||||||| |______| |||||||||' ...
    ' .....    ||||||||    ..... ' ...
    '||||||||| |||||||| |||||||||' ...
    '||||||||| |||||||| |||||||||' ...
    '________| |||||||| |________' ...
    '________|          |________' ...
    '________||||||||||||________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________'];


startTile(:,1:2) = [14 15;17 18];
pstartTile = struct('x',19,'y',15);

end

end