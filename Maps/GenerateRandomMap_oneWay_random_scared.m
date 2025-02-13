function empty_map = GenerateRandomMap_oneWay_random_scared
global startTile pstartTile;
global ghostNumber;
global map_rand;
global deadline; deadline = 60*3600;
global is_scared_train; is_scared_train = 1;

% dot_percentage = 0.7;
map_rand = rand;  % defines map type
num_dots = 2;  % the number of random dots in a map

%% block design
% global block_num;
% global ch_block;
% global map_type;  % block design changes between 2 maps according to current map_type
% TrialNum_in_block = 3;  % number of trials in a block
% if ch_block == 1
%     map_type = 1 - map_type;
%     block_num = map_type * TrialNum_in_block;
%     ch_block = 0;
% else
%     block_idx = floor(block_num / TrialNum_in_block);
%     map_type = mod(block_idx,2);
% end

%%
if map_rand < 0.25
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
        '_||||||||||||||||||||||||||_' ...
        '_|             ...........|_' ...
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
        '____________________________' ...
        '____________________________' ...
        '____________________________' ...
        '____________________________' ...
        '____________________________' ...
        '____________________________' ...
        '____________________________' ...
        '____________________________'];
         startTile(:,1:2) = [3 15;18 19];
elseif map_rand < 0.5
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
        '_||||||||||||||||||||||||||_' ...
        '_|...........             |_' ...
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
        '____________________________' ...
        '____________________________' ...
        '____________________________' ...
        '____________________________' ...
        '____________________________' ...
        '____________________________' ...
        '____________________________' ...
        '____________________________'];
         startTile(:,1:2) = [26 15;18 19];
elseif map_rand < 0.75
% if map_type == 0
    empty_map = [ ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________|||_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|||_____________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________'];
     startTile(:,1:2) = [14 15;5 19];
else
    empty_map = [ ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '____________|||_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________|.|_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________| |_____________' ...
    '____________|||_____________' ...
    '____________________________' ...
    '____________________________' ...
    '____________________________'];
     startTile(:,1:2) = [14 15;32 19];
end

dots_pos = find(empty_map=='.');
ghost_pos = dots_pos(randi(length(dots_pos)));
empty_map(ghost_pos) = ' ';

dots_pos = find(empty_map=='.');
no_dots_idx = randperm(length(dots_pos),length(dots_pos)-num_dots);
no_dots_pos = dots_pos(no_dots_idx);
for i = 1:length(no_dots_pos)
    empty_map(no_dots_pos(i)) = ' ';
end

startTile(1, 2) = mod(ghost_pos,28);
startTile(2, 2) = ceil(ghost_pos/28);
pstartTile = struct('x',14,'y',18);
ghostNumber = 2;
end