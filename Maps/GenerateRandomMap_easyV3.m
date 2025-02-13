function empty_map = GenerateRandomMap_easyV3(n,dot_percentage)
global fruit_pos;
global startTile pstartTile;
global ghostNumber;
global deadline; deadline = 60*3600;

empty_map = [ ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '||||||||||||||||||||||||||||' ...
    '|            ||            |' ...
    '| |||| ||||| || ||||| |||| |' ...
    '| |||| ||||| || ||||| |||| |' ...
    '| |||| ||||| || ||||| |||| |' ...
    '|                          |' ...
    '| |||| |||||||||||||| |||| |' ...
    '| |||| |||||||||||||| |||| |' ...
    '|                          |' ...
    '|||||| |||||||||||||| ||||||' ...
    '_____| |||||||||||||| |_____' ...
    '_____| ||          || |_____' ...
    '_____| || |||--||| || |_____' ...
    '|||||| || |______| || ||||||' ...
    '       || |______| ||       ' ...
    '|||||| || |______| || ||||||' ...
    '_____| || |||||||| || |_____' ...
    '_____| ||          || |_____' ...
    '_____| |||||||||||||| |_____' ...
    '|||||| |||||||||||||| ||||||' ...
    '|                          |' ...
    '| |||| |||||||||||||| |||| |' ...
    '| |||| |||||||||||||| |||| |' ...
    '| ||||                |||| |' ...
    '| |||| |||||||||||||| |||| |' ...
    '| |||| |||||||||||||| |||| |' ...
    '| ||||                |||| |' ...
    '| |||| |||||||||||||| |||| |' ...
    '| |||| |||||||||||||| |||| |' ...
    '|                          |' ...
    '||||||||||||||||||||||||||||' ...
    '____________________________' ...
    '____________________________'];

startTile(:,1:2) = [14 15;18 19];
pstartTile = struct('x',14,'y',27);
ghostNumber = 0;
[region1, region2, region3, region4, tunnel, region5] = DefineMapRegion;
number_of_dots_per_region13 = floor(dot_percentage * length(region1));
number_of_dots_per_region24 = floor(dot_percentage * length(region2));
region = zeros(1,2);
fruits = ['A' ; 'O' ; 'M' ; 'C' ; 'S'];
% Pick from region 1 and 3
x13 = rand(1,1);
if x13 < 0.5
    dots13 = datasample(region1,number_of_dots_per_region13,'Replace',false);
    ener13 = datasample(dots13, 1);
    region(1) = 1;
else
    dots13 = datasample(region3,number_of_dots_per_region13,'Replace',false);
    ener13 = datasample(dots13, 1);
    region(1) = 3;
end

% Pick from region 2 and 4
x24 = rand(1,1);
if x24 < 0.5
    dots24 = datasample(region2,number_of_dots_per_region24,'Replace',false);
    ener24 = datasample(dots24, 1);
    region(2) = 2;
else
    dots24 = datasample(region4,number_of_dots_per_region24,'Replace',false);
    ener24 = datasample(dots24, 1);
    region(2) = 4;
end

% dots in tunnel
dotsTunnel = datasample(tunnel,7,'Replace',false);
empty_map(dotsTunnel) = '.';

% Create map with dots, eners and fruit
if  n ==2
    % have 2 regions
    dots_region = [dots13',dots24'];
    energizer_region = [ener13, ener24];
    fruit_region = setdiff(dots_region, energizer_region);
    
    % fruit position
    fruit_pos = IndexToPosition(datasample(fruit_region,1));
    ener_pos = IndexToPosition(energizer_region);
    while abs(fruit_pos(1) - ener_pos(1)) + abs(fruit_pos(2) - ener_pos(3)) < 6 ...
            || abs(fruit_pos(1) - ener_pos(2)) + abs(fruit_pos(2) - ener_pos(4)) < 6 ...
            || abs(fruit_pos(1) - 14) + abs(fruit_pos(2) - 27) < 4 % far away from pacman start point
        fruit_pos = IndexToPosition(datasample(fruit_region,1));
    end
    fruit_region = PositionToIndex(fruit_pos(1),fruit_pos(2));
    
elseif n == 3
    % add one more region
    more_region = rand(1,1);
    if more_region < 0.5
        dot_region = eval(sprintf('region%d',setdiff([1,3], region(1))));
        dotsmore = datasample(dot_region,number_of_dots_per_region13,'Replace',false);
        enermore = datasample(dotsmore, 1);
    else
        dot_region = eval(sprintf('region%d',setdiff([2,4], region(2))));
        dotsmore = datasample(dot_region,number_of_dots_per_region24,'Replace',false);
        enermore = datasample(dotsmore, 1);
    end
    dots_region = [dots13',dots24',dotsmore'];
    energizer_region = [ener13,ener24,enermore];
    fruit_region = setdiff(dots_region, energizer_region);
    % fruit position
    fruit_pos = IndexToPosition(datasample(fruit_region,1));
    ener_pos = IndexToPosition(energizer_region);
    while abs(fruit_pos(1) - ener_pos(1)) + abs(fruit_pos(2) - ener_pos(4)) < 6 ...
            || abs(fruit_pos(1) - ener_pos(2)) + abs(fruit_pos(2) - ener_pos(5)) < 6 ...
            || abs(fruit_pos(1) - ener_pos(3)) + abs(fruit_pos(2) - ener_pos(6)) < 6 ...
            || abs(fruit_pos(1) - 14) + abs(fruit_pos(2) - 27) < 4 % far away from pacman start point
        fruit_pos = IndexToPosition(datasample(fruit_region,1));
    end
    fruit_region = PositionToIndex(fruit_pos(1),fruit_pos(2));
    
elseif n == 1
    % only 1 region
    more_region = rand(1,1);
    if more_region < 0.5
        dot_region = eval(sprintf('region%d',setdiff([1,3], region(1))));
        dotsmore = datasample(dot_region,number_of_dots_per_region13,'Replace',false);
        enermore = datasample(dotsmore, 1);
    else
        dot_region = eval(sprintf('region%d',setdiff([2,4], region(2))));
        dotsmore = datasample(dot_region,number_of_dots_per_region24,'Replace',false);
        enermore = datasample(dotsmore, 1);
    end
    dots_region = dotsmore';
    energizer_region = enermore;
    fruit_region = setdiff(dots_region, energizer_region);
    
    % fruit position
    fruit_pos = IndexToPosition(datasample(fruit_region,1));
    ener_pos = IndexToPosition(energizer_region);
    while abs(fruit_pos(1) - ener_pos(1)) + abs(fruit_pos(2) - ener_pos(2)) < 6 ...
            || abs(fruit_pos(1) - 14) + abs(fruit_pos(2) - 27) < 4 % far away from pacman start point
        fruit_pos = IndexToPosition(datasample(fruit_region,1));
    end
    fruit_region = PositionToIndex(fruit_pos(1),fruit_pos(2));
    
else
    error('dots region cannot larger than 3')
end

if length(unique(dots_region)) ~= length(dots_region)
    error('the dots region has replicated one')
end

% creat map
% hard = rand(1,1);
% if hard > 0.7
%     fprintf("hard version\n")
empty_map(datasample(region5, 3)) = '.';
% end
empty_map(setdiff([dots_region,energizer_region],fruit_region)) = '.';
empty_map(energizer_region) = 'o';
empty_map(fruit_region) = datasample(fruits,1);


end

function [region1, region2, region3, region4, tunnel, region5] = DefineMapRegion
empty_map = [ ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '||||||||||||||||||||||||||||' ...
    '|111111111111||222222222222|' ...
    '|1||||1|||||1||2|||||2||||2|' ...
    '|1||||1|||||1||2|||||2||||2|' ...
    '|1||||1|||||1||2|||||2||||2|' ...
    '|11111111111112222222222222|' ...
    '|1||||1||||||||||||||2||||2|' ...
    '|1||||1||||||||||||||2||||2|' ...
    '|11111111111112222222222222|' ...
    '||||||1||||||||||||||2||||||' ...
    '_____|1||||||||||||||2|_____' ...
    '_____|1||          ||2|_____' ...
    '_____|1|| |||--||| ||2|_____' ...
    '||||||1|| |______| ||2||||||' ...
    '5555555|| |______| ||5555555' ...
    '||||||3|| |______| ||4||||||' ...
    '_____|3|| |||||||| ||4|_____' ...
    '_____|3||          ||4|_____' ...
    '_____|3|| |||||||| ||4|_____' ...
    '||||||3||||||||||||||4||||||' ...
    '|33333333333334444444444444|' ...
    '|3||||3||||||||||||||4||||4|' ...
    '|3||||3||||||||||||||4||||4|' ...
    '|3||||3              4||||4|' ...
    '|3||||3||||||||||||||4||||4|' ...
    '|3||||3||||||||||||||4||||4|' ...
    '|3||||3666666666666664||||4|' ...
    '|3||||3||||||||||||||4||||4|' ...
    '|3||||3||||||||||||||4||||4|' ...
    '|33333333333334444444444444|' ...
    '||||||||||||||||||||||||||||' ...
    '____________________________' ...
    '____________________________'];

region1 = find(empty_map == '1')';
region2 = find(empty_map == '2')';
region3 = find(empty_map == '3')';
region4 = find(empty_map == '4')';
region5 = find(empty_map == '6')';
tunnel = find(empty_map == '5')';
end
