function empty_map = GenerateRandomMap_small_turns
global startTile pstartTile;
global ghostNumber;
global deadline; deadline = 60*3600;
global pac_rand
dot_percentage = 0.7;

empty_map = [ ...
        '____________________________' ...
        '__________|||||||||||||||||_' ...
        '__________|...............|_' ...
        '__________|.|||||||||||||.|_' ...
        '__________|.|___________|.|_' ...
        '_||||||||||.|___________|.|_' ...
        '_|..........|___________|.|_' ...
        '_|.||||||||||__||||||||||.|_' ...
        '_|.|___________|..........|_' ...
        '_|.|___________|.||||||||||_' ...
        '_|.||||||||||__|.|__________' ...
        '_|..........|__|.|__________' ...
        '_||||||||||.|__|.|__________' ...
        '__________|.|__|.|__________' ...
        '__________|.|__|.||||||||||_' ...
        '__________|.|__|..........|_' ...
        '__|||||||||.|__||||||||||.|_' ...
        '__|.........|___________|.|_' ...
        '__|.|||||||||___|||||||||.|_' ...
        '__|.|___________|.........|_' ...
        '__|.|___________|.|||||||||_' ...
        '__|.|___________|.|_________' ...
        '__|.||||||||||__|.|_________' ...
        '__|..........|__|.|_________' ...
        '__||||||||||.|__|.|_________' ...
        '___________|.|__|.|||||||||_' ...
        '___________|.|__|.........|_' ...
        '___________|.|__|||||||||.|_' ...
        '__||||||||||.|__________|.|_' ...
        '__|..........|__________|.|_' ...
        '__||||||||||||__________|.|_' ...
        '________________________|.|_' ...
        '__|||||||||||||||||||||||.|_' ...
        '__|.......................|_' ...
        '__|||||||||||||||||||||||||_' ...
        '____________________________'];
    
pac_rand = rand;
if pac_rand < 0.5
    pstartTile = struct('x',4,'y',34);
else
    pstartTile = struct('x',4,'y',30);
end
    
startTile(:,1:2) = [14 15;18 19];
ghostNumber = 0;

dots_pos = find(empty_map=='.');
no_dots_idx = randperm(length(dots_pos),floor(length(dots_pos)*(1-dot_percentage)));
no_dots_pos = dots_pos(no_dots_idx);
for i = 1:length(no_dots_pos)
    empty_map(no_dots_pos(i)) = ' ';
end

end