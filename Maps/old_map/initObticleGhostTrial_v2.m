function initObticleGhostTrial_v2(continueTrial)

globalDefinitions;
global doesGhostMove;doesGhostMove = 1;
global randomfig;
global NumOfTrials;
global NumOfError;
global NumOfSuccess;
global EndReward; EndReward=5;


ghostActive = 0;
ghostNumber = 1;
ghostEndPosition = 1; 

totally_random = 1; % 0 block by block; 1 random
%%%randomfig=2;  %% 0--UP  1--DOWN  2--UP&DOWN
if (continueTrial ==0) % start a new trial
if totally_random == 0 %block by block
    randomfig=0;
    if mod(NumOfSuccess,10)==0
        
        switch randomfig
            case 0
                show_online(['right block, CR = ',num2str(NumOfSuccess/NumOfTrials),'//',num2str(datestr(now,0))]);
            case 1
                show_online(['left block, CR = ',num2str(NumOfSuccess/NumOfTrials),'//',num2str(datestr(now,0))]);
        end
        
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
    randomfig = randi([0 7]);
    if mod(NumOfTrials,10)==0
        show_online(['Correct number/error/total = ',num2str([NumOfSuccess NumOfError NumOfTrials (NumOfSuccess/NumOfTrials)]),'/',num2str(datestr(now,0))]);
        NumOfTrials=0;
        NumOfSuccess=0;
        NumOfError=0;
    end
end

    % initialize gameMap   
    switch randomfig
        case 0 %Right
                 startTile(:,1) = [18;6];
%                  startTile(:,2) = [8,6];
                 endTile(:,1) = [18,13];
                 pacMan.tile = struct('x',11,'y',9);
                 constructMap(28,36, [ ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '_________||||||||||_________' ...
                '_________|        |_________' ...
                '_________| |||||| |_________' ...
                '_________| |    |.|_________' ...
                '_________| |    |.|_________' ...
                '_________| |    |.|_________' ...
                '_________| |    |.|_________' ...
                '_________| |||||| |_________' ...
                '_________|        |_________' ...
                '_________||||||||||_________' ...
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
            %%
            
            for g=1:ghostNumber
                ghosts(g).id = g;
                ghosts(g).mode = GHOST_OUTSIDE;
                %ghosts(g).arriveHomeMode = startMode(g);
                ghosts(g).color = GHOST_COLOR{g};
                ghosts(g).tile.x = startTile(1,g);
                ghosts(g).tile.y = startTile(2,g);
                ghosts(g).pixel.x = (startTile(1,g)-1)*tileSize + midTile.x;
                ghosts(g).pixel.y = (startTile(2,g)-1)*tileSize + midTile.y;
                ghosts(g).endpixel.x = (endTile(1,g)-1)*tileSize + midTile.x; %
                ghosts(g).endpixel.y = (endTile(2,g)-1)*tileSize + midTile.y; %
                ghosts(g).startPixel = ghosts(g).pixel;
                ghosts(g).dirEnum = 2; % down
                ghosts(g).dir = setDirFromEnum(ghosts(g).dirEnum);
                ghosts(g).faceDirEnum = ghosts(g).dirEnum;
            end
        case 1 %Left
                startTile(:,1) = [11;6];
%                 startTile(:,2) = [20,6];
                endTile(:,1) = [11,13];
                pacMan.tile = struct('x',18,'y',9);
                constructMap(28,36, [ ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '_________||||||||||_________' ...
                '_________|        |_________' ...
                '_________| |||||| |_________' ...
                '_________|.|    | |_________' ...
                '_________|.|    | |_________' ...
                '_________|.|    | |_________' ...
                '_________|.|    | |_________' ...
                '_________| |||||| |_________' ...
                '_________|        |_________' ...
                '_________||||||||||_________' ...
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
                ghosts(g).mode = GHOST_OUTSIDE ;
                %ghosts(g).arriveHomeMode = startMode(g);
                ghosts(g).color = GHOST_COLOR{g};
                ghosts(g).tile.x = startTile(1,g);
                ghosts(g).tile.y = startTile(2,g);
                ghosts(g).pixel.x = (startTile(1,g)-1)*tileSize + midTile.x;
                ghosts(g).pixel.y = (startTile(2,g)-1)*tileSize + midTile.y;
                ghosts(g).endpixel.x = (endTile(1,g)-1)*tileSize + midTile.x; %
                ghosts(g).endpixel.y = (endTile(2,g)-1)*tileSize + midTile.y; %
                ghosts(g).startPixel = ghosts(g).pixel;
                ghosts(g).dirEnum = 2; % down
                ghosts(g).dir = setDirFromEnum(ghosts(g).dirEnum);
                ghosts(g).faceDirEnum = ghosts(g).dirEnum;
               
            end
            
        case 2 %Up
                startTile(:,1) = [11;6];
%                 startTile(:,2) = [18,8];
                endTile(:,1) = [18;6];
                pacMan.tile = struct('x',14,'y',13);
                constructMap(28,36, [ ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '_________||||||||||_________' ...
                '_________|  ....  |_________' ...
                '_________| |||||| |_________' ...
                '_________| |    | |_________' ...
                '_________| |    | |_________' ...
                '_________| |    | |_________' ...
                '_________| |    | |_________' ...
                '_________| |||||| |_________' ...
                '_________|        |_________' ...
                '_________||||||||||_________' ...
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
                ghosts(g).mode = GHOST_OUTSIDE ;
                %ghosts(g).arriveHomeMode = startMode(g);
                ghosts(g).color = GHOST_COLOR{g};
                ghosts(g).tile.x = startTile(1,g);
                ghosts(g).tile.y = startTile(2,g);
                ghosts(g).pixel.x = (startTile(1,g)-1)*tileSize + midTile.x;
                ghosts(g).pixel.y = (startTile(2,g)-1)*tileSize + midTile.y;
                ghosts(g).endpixel.x = (endTile(1,g)-1)*tileSize + midTile.x; %
                ghosts(g).endpixel.y = (endTile(2,g)-1)*tileSize + midTile.y; %
                ghosts(g).startPixel = ghosts(g).pixel;
                ghosts(g).dirEnum = 3; % right
                ghosts(g).dir = setDirFromEnum(ghosts(g).dirEnum);
                ghosts(g).faceDirEnum = ghosts(g).dirEnum;
               
            end
        case 3 %Down
               startTile(:,1) = [11;13];
%                startTile(:,2) = [10,8];
               endTile(:,1) = [18;13];
               pacMan.tile = struct('x',14,'y',6);
               constructMap(28,36, [ ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '_________||||||||||_________' ...
                '_________|        |_________' ...
                '_________| |||||| |_________' ...
                '_________| |    | |_________' ...
                '_________| |    | |_________' ...
                '_________| |    | |_________' ...
                '_________| |    | |_________' ...
                '_________| |||||| |_________' ...
                '_________|  ....  |_________' ...
                '_________||||||||||_________' ...
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
                ghosts(g).mode = GHOST_OUTSIDE ;
                %ghosts(g).arriveHomeMode = startMode(g);
                ghosts(g).color = GHOST_COLOR{g};
                ghosts(g).tile.x = startTile(1,g);
                ghosts(g).tile.y = startTile(2,g);
                ghosts(g).pixel.x = (startTile(1,g)-1)*tileSize + midTile.x;
                ghosts(g).pixel.y = (startTile(2,g)-1)*tileSize + midTile.y;
                ghosts(g).endpixel.x = (endTile(1,g)-1)*tileSize + midTile.x; %
                ghosts(g).endpixel.y = (endTile(2,g)-1)*tileSize + midTile.y; %
                ghosts(g).startPixel = ghosts(g).pixel;
                ghosts(g).dirEnum = 3; % right
                ghosts(g).dir = setDirFromEnum(ghosts(g).dirEnum);
                ghosts(g).faceDirEnum = ghosts(g).dirEnum;
               
            end 
            
                 case 4 %Right
                 startTile(:,1) = [18;13];
%                  startTile(:,2) = [8,6];
                 endTile(:,1) = [18;6];
                 pacMan.tile = struct('x',11,'y',9);
                 constructMap(28,36, [ ...
                 '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '_________||||||||||_________' ...
                '_________|        |_________' ...
                '_________| |||||| |_________' ...
                '_________| |    |.|_________' ...
                '_________| |    |.|_________' ...
                '_________| |    |.|_________' ...
                '_________| |    |.|_________' ...
                '_________| |||||| |_________' ...
                '_________|        |_________' ...
                '_________||||||||||_________' ...
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
            %%
            
            for g=1:ghostNumber
                ghosts(g).id = g;
                ghosts(g).mode = GHOST_OUTSIDE;
                %ghosts(g).arriveHomeMode = startMode(g);
                ghosts(g).color = GHOST_COLOR{g};
                ghosts(g).tile.x = startTile(1,g);
                ghosts(g).tile.y = startTile(2,g);
                ghosts(g).pixel.x = (startTile(1,g)-1)*tileSize + midTile.x;
                ghosts(g).pixel.y = (startTile(2,g)-1)*tileSize + midTile.y;
                ghosts(g).endpixel.x = (endTile(1,g)-1)*tileSize + midTile.x; %
                ghosts(g).endpixel.y = (endTile(2,g)-1)*tileSize + midTile.y; %
                ghosts(g).startPixel = ghosts(g).pixel;
                ghosts(g).dirEnum = 0; % up
                ghosts(g).dir = setDirFromEnum(ghosts(g).dirEnum);
                ghosts(g).faceDirEnum = ghosts(g).dirEnum;
            end
            
            
                case 5%Left
                startTile(:,1) = [11;13];
%               startTile(:,2) = [20,6];
                endTile(:,1) = [11;6];
                pacMan.tile = struct('x',18,'y',9);
                constructMap(28,36, [ ...
               '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '_________||||||||||_________' ...
                '_________|        |_________' ...
                '_________| |||||| |_________' ...
                '_________|.|    | |_________' ...
                '_________|.|    | |_________' ...
                '_________|.|    | |_________' ...
                '_________|.|    | |_________' ...
                '_________| |||||| |_________' ...
                '_________|        |_________' ...
                '_________||||||||||_________' ...
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
                ghosts(g).mode = GHOST_OUTSIDE ;
                %ghosts(g).arriveHomeMode = startMode(g);
                ghosts(g).color = GHOST_COLOR{g};
                ghosts(g).tile.x = startTile(1,g);
                ghosts(g).tile.y = startTile(2,g);
                ghosts(g).pixel.x = (startTile(1,g)-1)*tileSize + midTile.x;
                ghosts(g).pixel.y = (startTile(2,g)-1)*tileSize + midTile.y;
                ghosts(g).endpixel.x = (endTile(1,g)-1)*tileSize + midTile.x; %
                ghosts(g).endpixel.y = (endTile(2,g)-1)*tileSize + midTile.y; %
                ghosts(g).startPixel = ghosts(g).pixel;
                ghosts(g).dirEnum = 0; % up
                ghosts(g).dir = setDirFromEnum(ghosts(g).dirEnum);
                ghosts(g).faceDirEnum = ghosts(g).dirEnum;
               
            end
            
            case 6 %Up
                startTile(:,1) = [18;6];
%                 startTile(:,2) = [18,8];
                endTile(:,1) = [11;6];
                pacMan.tile = struct('x',14,'y',13);
                constructMap(28,36, [ ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '_________||||||||||_________' ...
                '_________|  ....  |_________' ...
                '_________| |||||| |_________' ...
                '_________| |    | |_________' ...
                '_________| |    | |_________' ...
                '_________| |    | |_________' ...
                '_________| |    | |_________' ...
                '_________| |||||| |_________' ...
                '_________|        |_________' ...
                '_________||||||||||_________' ...
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
                ghosts(g).mode = GHOST_OUTSIDE ;
                %ghosts(g).arriveHomeMode = startMode(g);
                ghosts(g).color = GHOST_COLOR{g};
                ghosts(g).tile.x = startTile(1,g);
                ghosts(g).tile.y = startTile(2,g);
                ghosts(g).pixel.x = (startTile(1,g)-1)*tileSize + midTile.x;
                ghosts(g).pixel.y = (startTile(2,g)-1)*tileSize + midTile.y;
                ghosts(g).endpixel.x = (endTile(1,g)-1)*tileSize + midTile.x; %
                ghosts(g).endpixel.y = (endTile(2,g)-1)*tileSize + midTile.y; %
                ghosts(g).startPixel = ghosts(g).pixel;
                ghosts(g).dirEnum = 1; % left
                ghosts(g).dir = setDirFromEnum(ghosts(g).dirEnum);
                ghosts(g).faceDirEnum = ghosts(g).dirEnum;
               
            end
            
            case 7 %Down
               startTile(:,1) = [18;13];
%                startTile(:,2) = [10,8];
               endTile(:,1) = [11;13];
               pacMan.tile = struct('x',14,'y',6);
               constructMap(28,36, [ ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '____________________________' ...
                '_________||||||||||_________' ...
                '_________|        |_________' ...
                '_________| |||||| |_________' ...
                '_________| |    | |_________' ...
                '_________| |    | |_________' ...
                '_________| |    | |_________' ...
                '_________| |    | |_________' ...
                '_________| |||||| |_________' ...
                '_________|  ....  |_________' ...
                '_________||||||||||_________' ...
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
                ghosts(g).mode = GHOST_OUTSIDE ;
                %ghosts(g).arriveHomeMode = startMode(g);
                ghosts(g).color = GHOST_COLOR{g};
                ghosts(g).tile.x = startTile(1,g);
                ghosts(g).tile.y = startTile(2,g);
                ghosts(g).pixel.x = (startTile(1,g)-1)*tileSize + midTile.x;
                ghosts(g).pixel.y = (startTile(2,g)-1)*tileSize + midTile.y;
                ghosts(g).endpixel.x = (endTile(1,g)-1)*tileSize + midTile.x; %
                ghosts(g).endpixel.y = (endTile(2,g)-1)*tileSize + midTile.y; %
                ghosts(g).startPixel = ghosts(g).pixel;
                ghosts(g).dirEnum = 1; % left
                ghosts(g).dir = setDirFromEnum(ghosts(g).dirEnum);
                ghosts(g).faceDirEnum = ghosts(g).dirEnum;
               
            end
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
     if mod(NumOfTrials,10)==0
        show_online(['Correct number/error/total = ',num2str([NumOfSuccess NumOfError NumOfTrials (NumOfSuccess/NumOfTrials)]),'/',num2str(datestr(now,0))]);
        NumOfTrials=0;
        NumOfSuccess=0;
        NumOfError=0;
     end
    NumOfTrials=NumOfTrials+1;
    switch randomfig
        case 0
            startTile(:,1) = [18;6];
%           startTile(:,2) = [8,6];
            endTile(:,1) = [18,13];
            pacMan.tile = struct('x',11,'y',9);
        case 1
            startTile(:,1) = [11;6];
%           startTile(:,2) = [20,6];
            endTile(:,1) = [11,13];
            pacMan.tile = struct('x',18,'y',9);
        case 2
            startTile(:,1) = [11;6];
%           startTile(:,2) = [18,8];
            endTile(:,1) = [18;6];
            pacMan.tile = struct('x',14,'y',13);
        case 3
            startTile(:,1) = [11;13];
%           startTile(:,2) = [10,8];
            endTile(:,1) = [18;13];
            pacMan.tile = struct('x',14,'y',6);
        case 4
            startTile(:,1) = [18;13];
%           startTile(:,2) = [8,6];
            endTile(:,1) = [18;6];
            pacMan.tile = struct('x',11,'y',9);
        case 5
            startTile(:,1) = [11;13];
%           startTile(:,2) = [20,6];
            endTile(:,1) = [11;6];
            pacMan.tile = struct('x',18,'y',9);
        case 6
            startTile(:,1) = [18;6];
%           startTile(:,2) = [18,8];
            endTile(:,1) = [11;6];
            pacMan.tile = struct('x',14,'y',13);
        case 7
            startTile(:,1) = [18;13];
%           startTile(:,2) = [10,8];
            endTile(:,1) = [11;13];
            pacMan.tile = struct('x',14,'y',6);
    end

    
    pacMan.pixel = struct('x',(pacMan.tile.x)*tileSize-midTile.x+1,'y',(pacMan.tile.y-1)*tileSize+midTile.y);
    pacMan.dirEnum = -1;
    pacMan.nextDirEnum = -1;
    pacMan.dir = setDirFromEnum(-1);
    
    % ghost settings
    
    for g=1:ghostNumber
        ghosts(g).id = g;
        ghosts(g).mode = GHOST_OUTSIDE  ;  %%  hy 1118
        %ghosts(g).arriveHomeMode = startMode(g);
        ghosts(g).color = GHOST_COLOR{g};
        ghosts(g).tile.x = startTile(1,g);
        ghosts(g).tile.y = startTile(2,g);
        ghosts(g).pixel.x = (startTile(1,g)-1)*tileSize + midTile.x;
        ghosts(g).pixel.y = (startTile(2,g)-1)*tileSize + midTile.y;
        ghosts(g).endpixel.x = (endTile(1,g)-1)*tileSize + midTile.x; %
        ghosts(g).endpixel.y = (endTile(2,g)-1)*tileSize + midTile.y; %
        ghosts(g).startPixel = ghosts(g).pixel;
        switch randomfig
            case 0
                ghosts(g).dirEnum = 2; % down
            case 1
                ghosts(g).dirEnum = 2; % down
            case 2
                ghosts(g).dirEnum = 3; % right
            case 3
                ghosts(g).dirEnum = 3; % right
            case 4
                ghosts(g).dirEnum = 0; % up
            case 5
                ghosts(g).dirEnum = 0; % up
            case 6
                ghosts(g).dirEnum = 1; % left
            case 7
                ghosts(g).dirEnum = 1; % left
        end
        ghosts(g).dir = setDirFromEnum(ghosts(g).dirEnum);
        ghosts(g).faceDirEnum = ghosts(g).dirEnum;
    end
    energizerInit;
    fruitInit;
end