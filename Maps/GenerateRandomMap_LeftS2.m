function empty_map = GenerateRandomMap_LeftS2
global startTile pstartTile;
global ghostNumber;
global deadline; deadline = 60*300;
% dot_percentage = 0.7;
empty_map = [ ...
    '____________________________' ...
    '|||_________________________' ...
    '|.|_________________|||_____' ...
    '|.|__||||||_________| |_____' ...
    '|.|__|....|_________| |_____' ...
    '|.||||.||.||||||||||| |_____' ...
    '|......||....||.......|_____' ...
    '||||||||||||.||.|||||.|_____' ...
    '___________|....|___|.|_____' ...
    '___________||||||___|.|_____' ...
    '|||||||||||||||||||||.|_____' ...
    '|.....................|_____' ...
    '|.|||||||||||||||||||||_____' ...
    '|.|_________________|||_____' ...
    '|.|__||||||_________| |_____' ...
    '|.|__|....|_________| |_____' ...
    '|.||||.||.||||||||||| |_____' ...
    '|......||....||.......|_____' ...
    '||||||||||||.||.|||||.|_____' ...
    '___________|....|___|.|_____' ...
    '___________||||||___|.|_____' ...
    '|||||||||||||||||||||.|_____' ...
    '|.....................|_____' ...
    '|.|||||||||||||||||||||_____' ...
    '|.|_________________|||_____' ...
    '|.|__||||||_________| |_____' ...
    '|.|__|....|_________| |_____' ...
    '|.||||.||.||||||||||| |_____' ...
    '|......||....||.......|_____' ...
    '||||||||||||.||.|||||.|_____' ...
    '___________|....|___|.|_____' ...
    '___________||||||___|.||||||' ...
    '____________________|.     |' ...
    '____________________||||||||' ...
    '____________________________' ...
    '____________________________'];
startTile(:,1:2) = [14 15;18 19];
pstartTile = struct('x',26,'y',33);
ghostNumber = 0;
end