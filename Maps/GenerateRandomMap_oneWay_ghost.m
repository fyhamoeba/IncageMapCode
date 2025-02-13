function empty_map = GenerateRandomMap_oneWay_ghost
global startTile pstartTile;
global ghostNumber;
global deadline; deadline = 60*3600;
global map_rand;

map_rand = rand;
num_dots = 10;
% dot_percentage = 0.7;
if map_rand <0.5
empty_map = [ ...
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
    '||||||||||||||||||||||||||||' ...
    '|   o.......            ...|' ...
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

dots_pos = find(empty_map=='.');
no_dots_idx = randperm(length(dots_pos),length(dots_pos)-num_dots);
no_dots_pos = dots_pos(no_dots_idx);
for i = 1:length(no_dots_pos)
    empty_map(no_dots_pos(i)) = ' ';
end

startTile(:,1:2) = [27 15;18 19];
pstartTile = struct('x',13,'y',18);
ghostNumber = 1;

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
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '||||||||||||||||||||||||||||' ...
    '|...            .......o   |' ...
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

dots_pos = find(empty_map=='.');
no_dots_idx = randperm(length(dots_pos),length(dots_pos)-num_dots);
no_dots_pos = dots_pos(no_dots_idx);
for i = 1:length(no_dots_pos)
    empty_map(no_dots_pos(i)) = ' ';
end

startTile(:,1:2) = [2 15;18 19];
pstartTile = struct('x',13,'y',18);
ghostNumber = 1;
end
end