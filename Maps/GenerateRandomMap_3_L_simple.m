function empty_map = GenerateRandomMap_3_L_simple
global startTile pstartTile;
global ghostNumber;
global deadline; deadline = 60*3600;
global map_rand;
% dot_percentage = 0.7;
map_rand = rand;
num_dots = 10;
if map_rand<=0.125
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
    '________||||||||||||||______' ...
    '________| .........  |______' ...
    '________||||||||||||.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|||______' ...   
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ];
startTile(:,1:2) = [14 15;18 19];
pstartTile = struct('x',11,'y',18);
ghostNumber = 0;
elseif map_rand<=0.25
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
    '________||||||||||||||______' ...
    '________| .........  |______' ...
    '________|||||||||||| |______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________| |______' ...
    '___________________| |______' ...
    '___________________| |______' ...   
    '___________________|||______' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ];
startTile(:,1:2) = [14 15;18 19];
pstartTile = struct('x',21,'y',28);
ghostNumber = 0;
elseif map_rand<=0.375
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
    '___________________|||______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '________|||||||||||| |______' ...
    '________|    ......  |______' ...
    '________||||||||||||||______' ...
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
    '____________________________' ];
startTile(:,1:2) = [14 15;18 19];
pstartTile = struct('x',11,'y',23);
ghostNumber = 0;
elseif map_rand<=0.5
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
    '___________________|||______' ...
    '___________________| |______' ...
    '___________________| |______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '___________________|.|______' ...
    '_________|||||||||||.|______' ...
    '_________|.........  |______' ...
    '_________|||||||||||||______' ...
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
    '____________________________' ];
startTile(:,1:2) = [14 15;18 19];
pstartTile = struct('x',21,'y',13);
ghostNumber = 0;
elseif map_rand<=0.625
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
    '_____|||____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____| ||||||||||||_________' ...
    '_____|  .......   |_________' ...
    '_____||||||||||||||_________' ...
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
    '____________________________' ];
startTile(:,1:2) = [14 15;18 19];
pstartTile = struct('x',17,'y',23);
ghostNumber = 0;
elseif map_rand<=0.75
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
    '_____|||____________________' ...
    '_____| |____________________' ...
    '_____| |____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____| |||||||||||__________' ...
    '_____|  .........|__________' ...
    '_____|||||||||||||__________' ...
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
    '____________________________' ];
startTile(:,1:2) = [14 15;18 19];
pstartTile = struct('x',7,'y',13);
ghostNumber = 0;
elseif map_rand<=0.875
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
    '_____||||||||||||||||||_____' ...
    '_____|   ..........   |_____' ...
    '_____| ||||||||||||||||_____' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|||____________________' ...   
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ];
startTile(:,1:2) = [14 15;18 19];
pstartTile = struct('x',22,'y',18);
ghostNumber = 0;
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
    '_____||||||||||||||||||_____' ...
    '_____|    ............|_____' ...
    '_____| ||||||||||||||||_____' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____|.|____________________' ...
    '_____| |____________________' ...
    '_____| |____________________' ...
    '_____|||____________________' ...   
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ];
startTile(:,1:2) = [14 15;18 19];
pstartTile = struct('x',7,'y',28);
ghostNumber = 0;
end

dots_pos = find(empty_map=='.');
no_dots_idx = randperm(length(dots_pos),length(dots_pos)-num_dots);
no_dots_pos = dots_pos(no_dots_idx);

for i = 1:length(no_dots_pos)
    empty_map(no_dots_pos(i)) = ' ';
end

end