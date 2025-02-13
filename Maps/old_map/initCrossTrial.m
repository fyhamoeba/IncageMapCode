function initCrossTrial(continueTrial)

globalDefinitions;
global start_time;
if (continueTrial ==0) % start a new trial
    % initialize gameMap
    constructMap(28,36, [ ...
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
        '____________|.|_____________' ...
        '|||||||||||||.||||||||||||||' ...
        '|..........      ..........|' ...
        '|||||||||||||.||||||||||||||' ...
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
        '____________________________']);
    
    
    % pacman settings
    pacMan.color = [1 1 0 0.8];
    % % % %         pacMan.frame = 0;
    pacMan.flipPerTile = tileSize / flipInterval;
    pacMan.step = 0;
    pacMan.numSteps = 10;
    pacMan.angle = 300;
    pacMan.frames = 0;
    pacMan.eatPauseFramesLeft = 0;
    pacMan.tile = struct('x',14,'y',18);
    pacMan.pixel = struct('x',(pacMan.tile.x)*tileSize-midTile.x+1,'y',(pacMan.tile.y-1)*tileSize+midTile.y);
    pacMan.dirEnum = -1;
    pacMan.nextDirEnum = -1;
    pacMan.dir = setDirFromEnum(-1);
    % 11.16
    pacMan.distToMid = struct('x', 0, 'y', 10);
    pacMan.tilePixel = struct('x', -1, 'y', -1);
    
    % ghost settings
    ghostNumber = 0;
    
    energizerInit;
    fruitInit;
else % continue a trial after PacMan is dead
    % pacman settings
    pause(0.5);
   
        start_time = ((day(now)*24 + hour(now))*60+minute(now))*60+second(now);
    pacMan.tile = struct('x',14,'y',18);
    pacMan.pixel = struct('x',(pacMan.tile.x)*tileSize-midTile.x+1,'y',(pacMan.tile.y-1)*tileSize+midTile.y);
    pacMan.dirEnum = -1;
    pacMan.nextDirEnum = -1;
    pacMan.dir = setDirFromEnum(-1);
    
    % ghost settings
    energizerInit;
    fruitInit;
end

end