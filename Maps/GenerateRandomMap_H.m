function empty_map = GenerateRandomMap_H
global startTile pstartTile;
global ghostNumber;
global map_rand;
global deadline; deadline = 60*3600;
% dot_percentage = 0.7;
map_rand = rand;  % defines map type
% num_dots = 8;  % the number of random dots in a map

%%


empty_map = [ ...
    '____________________________' ...
    '____________________________' ...
    '||||||||||||||||||||||||||||' ...
    '|...                    ...|' ...
    '|.||||.|||||.|||||||||.|||.|' ...
    '|.||||.|||||.|||||||||.|||.|' ...
    '|  ......................  |' ...
    '| ||||.|||||.|||||||||.||| |' ...
    '| ||||.|||||.|||||||||.||| |' ...
    '| ||||.|||||.|||||||||.||| |' ...
    '|  ......................  |' ...
    '|.||||.|||||.|||||||||.|||.|' ...
    '|.||||.|||||.|||||||||.|||.|' ...
    '|...                    ...|' ...
    '|||||| || |||  ||| || ||||||' ...
    '_____| || |||--||| || |_____' ...
    '|||||| || |______| || ||||||' ...
    '          |______|          ' ...
    '||||||||||||||||||||||||||||' ...
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
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________'];


startTile(:,1:2) = [14 15;17 18];


map_rand = rand;

if map_rand < 0.25
    pstartTile = struct('x',2,'y',4);
elseif map_rand < 0.5
    pstartTile = struct('x',27,'y',4);
elseif map_rand < 0.75
    pstartTile = struct('x',2,'y',14);
else
    pstartTile = struct('x',27,'y',14);
end
ghostNumber = 1;
end