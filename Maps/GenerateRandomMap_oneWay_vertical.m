function empty_map = GenerateRandomMap_oneWay_vertical
global startTile pstartTile;
global ghostNumber;
global deadline; deadline = 60*3600;
% dot_percentage = 0.7;
num_dots = 6;
map_rand = rand;
if map_rand < 0.5
    empty_map = [ ...
        '___________|||||____________' ...
        '___________|||||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________|||||____________' ...
        '___________|||||____________' ...
        '____________________________' ...
        '____________________________'];
    startTile(:,1:2) = [14 1;3 19];
else
    empty_map = [ ...
        '___________|||||____________' ...
        '___________|||||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________||.||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|| ||____________' ...
        '___________|||||____________' ...
        '___________|||||____________' ...
        '____________________________' ...
        '____________________________'];
    startTile(:,1:2) = [14 1;32 19];
end
pstartTile = struct('x',14,'y',18);
ghostNumber = 1;

dots_pos = find(empty_map=='.');
no_dots_idx = randperm(length(dots_pos),length(dots_pos)-num_dots);
no_dots_pos = dots_pos(no_dots_idx);
for i = 1:length(no_dots_pos)
    empty_map(no_dots_pos(i)) = ' ';
end

end