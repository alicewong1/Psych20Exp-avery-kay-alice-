
DEBUG=true;
nBlocks=5;
trialTimeout=2;

% Initialize Screen/Results File
 Screen('Preference', 'VisualDebugLevel', 1);
 sizeScreen=get(0,'ScreenSize');
 sizeScreen=[sizeScreen(3:end),sizeScreen(3:end)];
 subjInitials = input('Subject''s initials: ','s'); 
 fprintf('Watch the balls in motion, press <1> if you see a collision of the two balls, or press ,<0> if it appears that the balls seem to pass through one another in a continuous stream\n');
 input('Press <enter> to begin');
 outFilename = ['MotionBounceIllusionResults_' subjInitials];
 
 %Keyboard SetUp
 KbName('UnifyKeyNames');
 
 %DEBUG set up
 if (DEBUG) 
    PsychDebugWindowConfiguration(0.5);
    [win, Scrnsize]=Screen('OpenWindow',0,[255 255 255],sizeScreen.*[.2 .5 .8 .85]); 
 else
    [win, Scrnsize]=Screen('OpenWindow',0,[255 255 255]);
 end
 if(~DEBUG), HideCursor;end
 for nBlock=1:nBlock
    for typenum=randperm(5)
        fprintf('Watch the balls in motion, see if you can detect if the balls collide with one another, or if they pass through each other./n');
        input('Press <enter> to begin');
        DrawDotsFunc(typenum,win,Scrnsize);
        nowtime=fliptime;
        responseGiven=0;
        response=0;
        while ((nowtime < flipTime + trialTimeout) && (responseGiven == 0))
            [responseGiven,secs,keyCode]=KbCheck(-1);
            if (responseGiven), response = KbName(keyCode); end
            nowtime = GetSecs; 
        end
        if (response(1)=='1')
            thisResp='Collision';
        elseif (response(1)=='0')
            thisResp='Stream';
        else
            thisResp='X';
        end
        results= results+thisResp;
    end
 end
%Clean Up and File Save
ShowCursor
if(~DEBUG),ListenChar(0); end
sca;
save(outFileName, 'results')
