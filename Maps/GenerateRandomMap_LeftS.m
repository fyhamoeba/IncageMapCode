function empty_map = GenerateRandomMap_LeftS
global startTile pstartTile;
global ghostNumber;
global deadline; deadline = 60*3600;
% dot_percentage = 0.7;
GN = rand;
proMap = 0.5;
if GN <= proMap
    empty_map = [ ...
        '____________________________' ...
        '____________________|||_____' ...
        '____________________| |_____' ...
        '_____||||||______|||| |_____' ...
        '_____|....|______|....|_____' ...
        '||||||.||.||||||||.||.|_____' ...
        '|......||....||....||.|_____' ...
        '|.||||||||||.||.|||||.|_____' ...
        '|.|________|....|___|.|_____' ...
        '|.|________||||||___|.|_____' ...
        '|.|||||||||||||||||||.|_____' ...
        '|..................||.|_____' ...
        '||||||||||||||||||.||.|_____' ...
        '_____||||||______|.||.|_____' ...
        '_____|....|______|.||.|_____' ...
        '||||||.||.||||||||.||.|_____' ...
        '|......||....||....||.|_____' ...
        '|.||||||||||.||.|| ||.|_____' ...
        '|.|________|....|| ||.|_____' ...
        '|.|________||||||||||.|_____' ...
        '|.|||||||||||||||||||.|_____' ...
        '|..................||.|_____' ...
        '||||||||||||||||||.||.|_____' ...
        '_____||||||______|.||.|_____' ...
        '_____|....|______|.||.|_____' ...
        '||||||.||.||||||||.||.|_____' ...
        '|......||....||....||.|_____' ...
        '|.||||||||||.||.|| ||.|_____' ...
        '|.|________|....|| ||.|_____' ...
        '|.|________||||||||||.|_____' ...
        '|.|_________________|.|_____' ...
        '|.|_________________|.||||||' ...
        '|.|_________________|.     |' ...
        '|||_________________||||||||' ...
        '____________________________' ...
        '____________________________'];
elseif GN > proMap
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
end
startTile(:,1:2) = [14 15;18 19];
pstartTile = struct('x',26,'y',33);
ghostNumber = 0;
end