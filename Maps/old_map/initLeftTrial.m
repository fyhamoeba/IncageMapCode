function initLeftTrial(continueTrial)

globalDefinitions;
global doesGhostMove;doesGhostMove = 0;
global randomfig;
global NumOfTrials;
global NumOfError;
global NumOfSuccess;    

ghostNumber = 1;
ghostActive=0;

totally_random = 1; % 0 block by block; 1 random
%%%randomfig=2;  %% 0--UP  1--DOWN  2--UP&DOWN
if (continueTrial ==0) % start a new trial
    % initialize gameMap
    if totally_random == 0 %block by block
        if mod(NumOfSuccess,10)==0
            show_online(['left block, CR = ',num2str(NumOfSuccess/NumOfTrials),'//',num2str(datestr(now,0))]);            
        end
       if NumOfSuccess==30
           if NumOfSuccess/NumOfTrials > 0.75
                randomfig=1-randomfig;
            end
            NumOfTrials=0;
            NumOfSuccess=0;
            NumOfError=0;
        end
    else %the condition for each trial is selected randomly
        randomfig = round(rand);
        if mod(NumOfTrials,30) == 0
            show_online(['Correct number/error/total = ',num2str([NumOfSuccess NumOfError NumOfTrials]),'/',num2str(datestr(now,0))]);
        end
    end
    
            startTile = [18;8];
            pacMan.tile = struct('x',14,'y',8);
            constructMap(28,36, [ ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '_______||||||||||||||_______' ...
                '_______|. ...       |_______' ...
                '_______||||||||||||||_______' ...
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
                '____________________________']);
            NumOfTrials=NumOfTrials+1;
%             NumOfError=0;
            
            ghost = struct( ...
        'id', 1, ...
        'dir', struct('x',1,'y',0), ...
        'dirEnum', 0, ...
        'mode', 0, ...
        'targeting', 0, ...
        'scared', 0, ...
        'sigReverse', 0, ...
        'sigLeaveHome', 0, ...
        'faceDirEnum', 0, ...
        'pixel', struct('x',0,'y',0), ...        % pixel position
        'tile', struct('x',1,'y',1), ...       % tile position
        'tilePixel', struct('x',0,'y',0), ...    % pixel location inside tile
        'distToMid', struct('x',0,'y',0), ...    % pixel distance to mid-tile
        'targetTile', struct('x',0,'y',0), ...   % tile position used for targeting
        'frames', 0);    % frame count
    
    ghosts = ghost;
    
   
    for g=1:ghostNumber
        ghosts(g).id = g;
        ghosts(g).mode = GHOST_PACING_HOME ;
        %ghosts(g).arriveHomeMode = startMode(g);
        ghosts(g).color = GHOST_COLOR{g};
        ghosts(g).tile.x = startTile(1);
        ghosts(g).tile.y = startTile(2);
        ghosts(g).pixel.x = (startTile(1,g)-1)*tileSize + midTile.x;
        ghosts(g).pixel.y = (startTile(2,g)-1)*tileSize + midTile.y;
        ghosts(g).startPixel = ghosts(g).pixel;
        ghosts(g).dirEnum = mod(g,2)*2; % up or down
        ghosts(g).dir = setDirFromEnum(ghosts(g).dirEnum);
        ghosts(g).faceDirEnum = ghosts(g).dirEnum;
    end

    % pacman settings
    pacMan.color = [1 1 0 0.8];
    % % % %         pacMan.frame = 0;
    pacMan.flipPerTile = tileSize / flipInterval;
    pacMan.step = 0;
    pacMan.numSteps = 10;
    pacMan.angle = 300;
    pacMan.frames = 0;
    pacMan.eatPauseFramesLeft = 0;
%     pacMan.tile = struct('x',14,'y',11);
    pacMan.pixel = struct('x',(pacMan.tile.x)*tileSize-midTile.x+1,'y',(pacMan.tile.y-1)*tileSize+midTile.y);
    pacMan.dirEnum = -1;
    pacMan.nextDirEnum = -1;
    pacMan.dir = setDirFromEnum(-1);
    % 11.16
    pacMan.distToMid = struct('x', 0, 'y', 10);
    pacMan.tilePixel = struct('x', -1, 'y', -1);
    
    % ghost settings
    
    
    energizerInit;
    fruitInit;
else % continue a trial after PacMan is dead
    % pacman settings
    NumOfTrials=NumOfTrials+1;
            startTile = [18;8];
            pacMan.tile = struct('x',14,'y',8);
%             startTile = [14;6];
%             pacMan.tile = struct('x',14,'y',8);
   
%     pacMan.tile = struct('x',14,'y',11);
    pacMan.pixel = struct('x',(pacMan.tile.x)*tileSize-midTile.x+1,'y',(pacMan.tile.y-1)*tileSize+midTile.y);
    pacMan.dirEnum = -1;
    pacMan.nextDirEnum = -1;
    pacMan.dir = setDirFromEnum(-1);
    
    % ghost settings

    for g=1:ghostNumber
        ghosts(g).id = g;
        ghosts(g).mode = GHOST_PACING_HOME  ;  %%  hy 1118 
        %ghosts(g).arriveHomeMode = startMode(g);
        ghosts(g).color = GHOST_COLOR{g};
        ghosts(g).tile.x = startTile(1);
        ghosts(g).tile.y = startTile(2);
        ghosts(g).pixel.x = (startTile(1,g)-1)*tileSize + midTile.x;
        ghosts(g).pixel.y = (startTile(2,g)-1)*tileSize + midTile.y;
        ghosts(g).startPixel = ghosts(g).pixel;
        ghosts(g).dirEnum = mod(g,2)*2; % up or down
        ghosts(g).dir = setDirFromEnum(ghosts(g).dirEnum);
        ghosts(g).faceDirEnum = ghosts(g).dirEnum;
    end
    energizerInit;
    fruitInit;
end

end