function empty_map = GenerateRandomMap_easyV10_corner(n,dot_percentage)
global fruit_pos;
global startTile pstartTile;
global ghostNumber;
global deadline; deadline = 900;

ghostNumber = 0;
startTile(:,1:2) = [14 15;18 19];
pstartTile = struct('x',14,'y',27);
% dot_percentage = 0.7;
empty_map = [ ...
    '____________________________' ...
    '____________________________' ...
    '____________________________' ...
    '||||||||||||||||||||||||||||' ...
    '|...         ||         ...|' ...
    '|.||||.|||||.||.|||||.||||.|' ...
    '|.||||.|||||.||.|||||.||||.|' ...
    '| ||||.|||||.||.|||||.|||| |' ...
    '| ....                .... |' ...
    '| ||||.||.||||||||.||.|||| |' ...
    '| ||||.||.||||||||.||.|||| |' ...
    '|      ||o...||...o||      |' ...
    '|||||| |||||.||.||||| ||||||' ...
    '_____| |||||.||.||||| |_____' ...
    '_____| || ........ || |_____' ...
    '_____| || |||--||| || |_____' ...
    '|||||| || |______| || ||||||' ...
    '......    |______|     .....' ...
    '|||||| ||.|______|.|| ||||||' ...
    '_____| ||.||||||||.|| |_____' ...
    '_____| || ........ || |_____' ...
    '_____| || |||||||| || |_____' ...
    '|||||| || |||||||| || ||||||' ...
    '|...      .AOMCS..      ...|' ...
    '|.||||.||||||||||||||.||||.|' ...
    '|.||||.||||||||||||||.||||.|' ...
    '| ||||                |||| |' ...
    '| ||||.||||||||||||||.|||| |' ...
    '| ||||.||||||||||||||.|||| |' ...
    '| ||||    ........    |||| |' ...
    '|.||||.||||||||||||||.||||.|' ...
    '|.||||.||||||||||||||.||||.|' ...
    '|...                    ...|' ...
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


% creat map

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
