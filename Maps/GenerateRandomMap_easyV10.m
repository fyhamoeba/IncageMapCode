function empty_map = GenerateRandomMap_easyV10(n,dot_percentage)
global fruit_pos;
global startTile pstartTile;
global ghostNumber;
global deadline; deadline = 900;

ghostNumber = 1;
startTile(:,1:2) = [14 15;18 19];
pstartTile = struct('x',14,'y',27);
% dot_percentage = 0.7;
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
    '| |||| || |||||||| || |||| |' ...
    '| |||| || |||||||| || |||| |' ...
    '|      ||    ||    ||      |' ...
    '|||||| ||||| || ||||| ||||||' ...
    '_____| ||||| || ||||| |_____' ...
    '_____| ||          || |_____' ...
    '_____| || |||--||| || |_____' ...
    '|||||| || |______| || ||||||' ...
    '          |______|          ' ...
    '|||||| || |______| || ||||||' ...
    '_____| || |||||||| || |_____' ...
    '_____| ||          || |_____' ...
    '_____| || |||||||| || |_____' ...
    '|||||| || |||||||| || ||||||' ...
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
% empty_map = [ ...
%     '____________________________' ...
%     '____________________________' ...
%     '____________________________' ...
%     '||||||||||||||||||||||||||||' ...
%     '|            ||            |' ...
%     '| |||| ||||| || ||||| |||| |' ...
%     '| |||| ||||| || ||||| |||| |' ...
%     '| |||| ||||| || ||||| |||| |' ...
%     '|                          |' ...
%     '| |||| || |||||||| || |||| |' ...
%     '| |||| || |||||||| || |||| |' ...
%     '|      ||    ||    ||      |' ...
%     '|||||| ||||| || ||||| ||||||' ...
%     '_____| ||||| || ||||| |_____' ...
%     '_____| ||          || |_____' ...
%     '_____| || |||--||| || |_____' ...
%     '|||||| || |______| || ||||||' ...
%     '          |______|          ' ...
%     '|||||| || |______| || ||||||' ...
%     '_____| || |||||||| || |_____' ...
%     '_____| ||          || |_____' ...
%     '_____| || |||||||| || |_____' ...
%     '|||||| || |||||||| || ||||||' ...
%     '|            ||            |' ...
%     '| |||| ||||| || ||||| |||| |' ...
%     '| |||| ||||| || ||||| |||| |' ...
%     '| ||||                |||| |' ...
%     '| |||| || |||||||| || |||| |' ...
%     '| |||| || |||||||| || |||| |' ...
%     '|      ||    ||    ||      |' ...
%     '| |||||||||| || |||||||||| |' ...
%     '| |||||||||| || |||||||||| |' ...
%     '|                          |' ...
%     '||||||||||||||||||||||||||||' ...
%     '____________________________' ...
%     '____________________________'];

[region1, region2, region3, region4, tunnel] = DefineMapRegion;
if length(region1) == length(region2)
    number_of_dots_per_region12 = floor(dot_percentage * length(region1));
    number_of_dots_per_region34 = floor(dot_percentage * length(region3));
    dots1 = datasample(region1,number_of_dots_per_region12,'Replace',false);
    ener1 = datasample(dots1, 1);
    dots2 = datasample(region2,number_of_dots_per_region12,'Replace',false);
    ener2 = datasample(dots2, 1);
    dots3 = datasample(region3,number_of_dots_per_region34,'Replace',false);
    ener3 = datasample(dots3, 1);
    dots4 = datasample(region4,number_of_dots_per_region34,'Replace',false);
    ener4 = datasample(dots4, 1);
    dots = [dots1,dots2,dots3,dots4];
    eners = [ener1,ener2,ener3,ener4];
elseif length(region1) == length(region3)
    number_of_dots_per_region13 = floor(dot_percentage * length(region1));
    number_of_dots_per_region24 = floor(dot_percentage * length(region2));
    dots1 = datasample(region1,number_of_dots_per_region13,'Replace',false);
    ener1 = datasample(dots1, 1);
    dots2 = datasample(region2,number_of_dots_per_region24,'Replace',false);
    ener2 = datasample(dots2, 1);
    dots3 = datasample(region3,number_of_dots_per_region13,'Replace',false);
    ener3 = datasample(dots3, 1);
    dots4 = datasample(region4,number_of_dots_per_region24,'Replace',false);
    ener4 = datasample(dots4, 1);
    dots = [dots1,dots2,dots3,dots4];
    eners = [ener1,ener2,ener3,ener4];
else
    error("something wrong with region defination")
end
fruits = ['A' ; 'O' ; 'M' ; 'C' ; 'S'];

% dots in tunnel
dotsTunnel = datasample(tunnel,7,'Replace',false);
empty_map(dotsTunnel) = '.';

% Create map with dots, eners and fruit
if  n <= 4
    % have 2 regions
    dots_region = datasample(dots',n,'Replace',false);
    energizer_region = eners(ismember(eners, dots_region));
    dots_region = reshape(dots_region,1,[]);
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
else
    error('dots region cannot larger than 3')
end

if length(unique(dots_region)) ~= length(dots_region)
    error('the dots region has replicated one')
end

% creat map
empty_map(setdiff([dots_region,energizer_region],fruit_region)) = '.';
empty_map(energizer_region) = 'o';
empty_map(fruit_region) = datasample(fruits,1);
% %% special map
% if rand > 0.9
%     startTile(:,1:2) = [14 15;18 19];
%     pstartTile = struct('x',26,'y',33);
%     ghostNumber = 0;
%     fprintf("ghostNumber = %d\n", ghostNumber)
%     fprintf("-----special map-----\n")
%     GN = rand;
%     proMap = 0.5;
%     if GN <= proMap
%         empty_map = [ ...
%             '____________________________' ...
%             '____________________|||_____' ...
%             '____________________| |_____' ...
%             '_____||||||______|||| |_____' ...
%             '_____|....|______|....|_____' ...
%             '||||||.||.||||||||.||.|_____' ...
%             '|......||....||....||.|_____' ...
%             '|.||||||||||.||.|||||.|_____' ...
%             '|.|__|||||||....|___|.|_____' ...
%             '|.|__|....|||||||___|.|_____' ...
%             '|.||||.||.|||||||||||.|_____' ...
%             '|......||....||....||.|_____' ...
%             '| ||||||||||.||.||.||.|_____' ...
%             '| |__|||||||....||.||.|_____' ...
%             '|||__|....||||||||.||.|_____' ...
%             '||||||.||.||||||||.||.|_____' ...
%             '|......||....||....||.|_____' ...
%             '|.||||||||||.||.|| ||.|_____' ...
%             '|.||||||||||....|| ||.|_____' ...
%             '|.||||....|||||||||||.|_____' ...
%             '|.||||.||.|||||||||||.|_____' ...
%             '|......||....||....||.|_____' ...
%             '| ||||||||||.||.||.||.|_____' ...
%             '| |__|||||||....||.||.|_____' ...
%             '|||__|....||||||||.||.|_____' ...
%             '||||||.||.||||||||.||.|_____' ...
%             '|......||....||....||.|_____' ...
%             '|.||||||||||.||.|| ||.|_____' ...
%             '|.|________|....|| ||.|_____' ...
%             '|.|________||||||||||.|_____' ...
%             '|.|_________________|.|_____' ...
%             '|.|_________________|.||||||' ...
%             '|.|_________________|.     |' ...
%             '|||_________________||||||||' ...
%             '____________________________' ...
%             '____________________________'];
%     elseif GN > proMap
%         empty_map = [ ...
%             '____________________________' ...
%             '|||_________________________' ...
%             '|.|_________________|||_____' ...
%             '|.|__||||||_________| |_____' ...
%             '|.|__|....|_________| |_____' ...
%             '|.||||.||.||||||||||| |_____' ...
%             '|......||....||.......|_____' ...
%             '||||||||||||.||.|||||.|_____' ...
%             '|||__|||||||....|___|.|_____' ...
%             '| |__|....|||||||___|.|_____' ...
%             '| ||||.||.|||||||||||.|_____' ...
%             '|......||....||.......|_____' ...
%             '|.||||||||||.||.|||||||_____' ...
%             '|.|________|....|___|||_____' ...
%             '|.|__||||||||||||___| |_____' ...
%             '|.|__|....|_________| |_____' ...
%             '|.||||.||.||||||||||| |_____' ...
%             '|......||....||.......|_____' ...
%             '||||||||||||.||.|||||.|_____' ...
%             '|||__|||||||....|___|.|_____' ...
%             '| |__|....|||||||___|.|_____' ...
%             '| ||||.||.|||||||||||.|_____' ...
%             '|......||....||.......|_____' ...
%             '|.||||||||||.||.|||||||_____' ...
%             '|.|________|....|___|||_____' ...
%             '|.|__||||||||||||___| |_____' ...
%             '|.|__|....|_________| |_____' ...
%             '|.||||.||.||||||||||| |_____' ...
%             '|......||....||.......|_____' ...
%             '||||||||||||.||.|||||.|_____' ...
%             '___________|....|___|.|_____' ...
%             '___________||||||___|.||||||' ...
%             '____________________|.     |' ...
%             '____________________||||||||' ...
%             '____________________________' ...
%             '____________________________'];
%     end
% end
end

function [region1, region2, region3, region4, tunnel] = DefineMapRegion
% empty_map = [ ...
%     '____________________________' ...
%     '____________________________' ...
%     '____________________________' ...
%     '||||||||||||||||||||||||||||' ...
%     '|111111111111||222222222222|' ...
%     '|1||||1|||||1||2|||||2||||2|' ...
%     '|1||||1|||||1||2|||||2||||2|' ...
%     '|1||||1|||||1||2|||||2||||2|' ...
%     '|11111111111112222222222222|' ...
%     '|1||||1||1||||||||2||2||||2|' ...
%     '|1||||1||1||||||||2||2||||2|' ...
%     '|111111||1111||2222||222222|' ...
%     '||||||1|||||1||2|||||2||||||' ...
%     '_____|1|||||1||2|||||2|_____' ...
%     '_____|1||          ||2|_____' ...
%     '_____|1|| |||--||| ||2|_____' ...
%     '||||||1|| |______| ||2||||||' ...
%     '5555555   |______|   5555555' ...
%     '||||||3|| |______| ||4||||||' ...
%     '_____|3|| |||||||| ||4|_____' ...
%     '_____|3||          ||4|_____' ...
%     '_____|3|| |||||||| ||4|_____' ...
%     '||||||3||||||||||||||4||||||' ...
%     '|33333333333334444444444444|' ...
%     '|3||||3||||||||||||||4||||4|' ...
%     '|3||||3||||||||||||||4||||4|' ...
%     '|3||||3333        4444||||4|' ...
%     '|3||||3||||||||||||||4||||4|' ...
%     '|3||||3||||||||||||||4||||4|' ...
%     '|3||||3333333344444444||||4|' ...
%     '|3||||3||||||||||||||4||||4|' ...
%     '|3||||3||||||||||||||4||||4|' ...
%     '|33333333333334444444444444|' ...
%     '||||||||||||||||||||||||||||' ...
%     '____________________________' ...
%     '____________________________'];
% empty_map = [ ...
%     '____________________________' ...
%     '____________________________' ...
%     '____________________________' ...
%     '||||||||||||||||||||||||||||' ...
%     '|111111111111||333333333333|' ...
%     '|1||||1|||||1||3|||||3||||3|' ...
%     '|1||||1|||||1||3|||||3||||3|' ...
%     '|1||||1|||||1||3|||||3||||3|' ...
%     '|11111111111113333333333333|' ...
%     '|1||||1||1||||||||3||3||||3|' ...
%     '|1||||1||1||||||||3||3||||3|' ...
%     '|111111||1111||3333||333333|' ...
%     '||||||1|||||1||3|||||3||||||' ...
%     '_____|1|||||1||3|||||3|_____' ...
%     '_____|1||          ||3|_____' ...
%     '_____|1|| |||--||| ||3|_____' ...
%     '||||||1|| |______| ||3||||||' ...
%     '5555555   |______|   5555555' ...
%     '||||||2|| |______| ||4||||||' ...
%     '_____|2|| |||||||| ||4|_____' ...
%     '_____|2||          ||4|_____' ...
%     '_____|2||2||||||||4||4|_____' ...
%     '||||||2||2||||||||4||4||||||' ...
%     '|222222222222||444444444444|' ...
%     '|2||||2||||| || |||||4||||4|' ...
%     '|2||||2||||| || |||||4||||4|' ...
%     '|2||||2              4||||4|' ...
%     '|2||||2|| |||||||| ||4||||4|' ...
%     '|2||||2||2||||||||4||4||||4|' ...
%     '|222222||2222||4444||444444|' ...
%     '|2||||||||||2||4||||||||||4|' ...
%     '|2||||||||||2||4||||||||||4|' ...
%     '|22222222222224444444444444|' ...
%     '||||||||||||||||||||||||||||' ...
%     '____________________________' ...
%     '____________________________'];
% region1 = find(empty_map == '1')';
% region2 = find(empty_map == '2')';
% region3 = find(empty_map == '3')';
% region4 = find(empty_map == '4')';
% tunnel = find(empty_map == '5')';
empty_map = [ ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '||||||||||||||||||||||||||||' ...
    '|111111111111||333333333333|' ...
    '|1||||1|||||1||3|||||3||||3|' ...
    '|1||||1|||||1||3|||||3||||3|' ...
    '|1||||1|||||1||3|||||3||||3|' ...
    '|11111111111113333333333333|' ...
    '|1||||1|| |||||||| ||3||||3|' ...
    '|1||||1|| |||||||| ||3||||3|' ...
    '|111111||    ||    ||333333|' ...
    '||||||5||||| || |||||5||||||' ...
    '_____|5||||| || |||||5|_____' ...
    '_____|5||          ||5|_____' ...
    '_____|5|| |||--||| ||5|_____' ...
    '||||||5|| |______| ||5||||||' ...
    '      5   |______|   5      ' ...
    '||||||5|| |______| ||5||||||' ...
    '_____|5|| |||||||| ||5|_____' ...
    '_____|5||          ||5|_____' ...
    '_____|5|| |||||||| ||5|_____' ...
    '||||||5|| |||||||| ||5||||||' ...
    '|22222222222224444444444444|' ...
    '|2||||2||||||||||||||4||||4|' ...
    '|2||||2||||||||||||||4||||4|' ...
    '|2||||222          444||||4|' ...
    '|2||||2||||||||||||||4||||4|' ...
    '|2||||2||||||||||||||4||||4|' ...
    '|2||||2              4||||4|' ...
    '|2||||2||||||||||||||4||||4|' ...
    '|2||||2||||||||||||||4||||4|' ...
    '|22222222222224444444444444|' ...
    '||||||||||||||||||||||||||||' ...
    '____________________________' ...
    '____________________________'];

region1 = find(empty_map == '1')';
region2 = find(empty_map == '2')';
region3 = find(empty_map == '3')';
region4 = find(empty_map == '4')';
tunnel = find(empty_map == '5')';
end
