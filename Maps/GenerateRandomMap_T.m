function empty_map = GenerateRandomMap_T
global startTile pstartTile;
global ghostNumber;
global deadline; deadline = 60*3600;
global map_rand current_round;
% dot_percentage = 0.7;

% map_rand=repmat([0.25 0.5 0.75 1],1,100);
% randseed = randsrc([1,2,3,4;0.25,.25,.25,.25]);
map_rand = [1,4,1,1,4,1,4,4,2,1,1,3,4,1,4,2,3,1,1,4,4,1,2,3,4,3,2,1,2,3,2,2,3,3,1,2,4,2,1,3,4];
map_rand = [map_rand,randsample([1,2,3,4],800,1)];

randSeed = map_rand(current_round);

switch randSeed
    case 2
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
    '____________|||_____________' ...
    '____________| |_____________' ...
    '____________|.|_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________| |_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '_|||||||||||| |||||||||||||_' ...
    '_|     o              ....|_' ...
    '_||||||||||||||||||||||||||_' ...
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

startTile(:,1:2) = [22 15;25 19];
pstartTile = struct('x',14,'y',13);
ghostNumber = 1;

    case 1
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
    '_||||||||||||||||||||||||||_' ...
    '_|....         o          |_' ...
    '_|||||||||||| |||||||||||||_' ...
    '____________| |_____________' ...
    '____________|.|_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________| |_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________| |_____________' ...
    '____________|||_____________' ...
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
    '____________________________' ];

startTile(:,1:2) = [8 15;11 19];
pstartTile = struct('x',14,'y',22);
ghostNumber = 1;

    case 3
empty_map = [ ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '|||_________________________' ...
    '| |_________________________' ...
    '| |_________________________' ...
    '| |_________________________' ...
    '| |_________________________' ...
    '| |_________________________' ...
    '| |_________________________' ...
    '| |_________________________' ...
    '| |_________________________' ...
    '|o|_________________________' ...
    '| |_________________________' ...
    '| |_________________________' ...
    '| |||||||||||||_____________' ...
    '|   .  . . .  |_____________' ...
    '| |||||||||||||_____________' ...
    '| |_________________________' ...
    '| |_________________________' ...
    '| |_________________________' ...
    '| |_________________________' ...
    '| |_________________________' ...
    '| |_________________________' ...
    '| |_________________________' ...
    '|.|_________________________' ...
    '|.|_________________________' ...
    '|.|_________________________' ...
    '|.|_________________________' ...
    '|||_________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ];

startTile(:,1:2) = [2 15;24 19];
pstartTile = struct('x',14,'y',18);
ghostNumber =1;

    case 4
empty_map = [ ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '______________|||___________' ...
    '______________|.|___________' ...
    '______________|.|___________' ...
    '______________|.|___________' ...
    '______________|.|___________' ...
    '______________| |___________' ...
    '______________| |___________' ...
    '______________| |___________' ...
    '______________| |___________' ...
    '______________| |___________' ...
    '______________| |___________' ...
    '______________| |___________' ...
    '__||||||||||||| |___________' ...
    '__|  .  .. . .  |___________' ...
    '__||||||||||||| |___________' ...
    '______________| |___________' ...
    '______________| |___________' ...
    '______________|o|___________' ...
    '______________| |___________' ...
    '______________| |___________' ...
    '______________| |___________' ...
    '______________| |___________' ...
    '______________| |___________' ...
    '______________| |___________' ...
    '______________| |___________' ...
    '______________| |___________' ...
    '______________|||___________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ];
startTile(:,1:2) = [16 15;10 19];
pstartTile = struct('x',4,'y',18);
ghostNumber =1;
end
end