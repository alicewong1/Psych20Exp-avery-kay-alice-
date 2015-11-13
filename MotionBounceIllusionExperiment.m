
DEBUG= true;
nBlocks=5;
trialTimeout=5;
nFrames=[50 100 150 200 250];
totalResult=0;
nTrial=0;
AssertOpenGL;

% Initialize Screen/Results File
 Screen('Preference', 'VisualDebugLevel', 1);
 sizeScreen=get(0,'ScreenSize');
 sizeScreen=[sizeScreen(3:end),sizeScreen(3:end)];
 subjInitials = input('Subject''s initials: ','s'); 
 fprintf('Watch the balls in motion, press <1> if you see a collision of the two balls, or press ,<0> if it appears that the balls seem to pass through one another in a continuous stream\n');
 input('Press <enter> to begin');
 outFileName = ['MotionBounceIllusionResults_' subjInitials];
 
 %Keyboard SetUp
 KbName('UnifyKeyNames');
 
 %DEBUG set up
 if (DEBUG) 
    [win, winRect]=Screen('OpenWindow',0,[255 255 255],sizeScreen.*[.2 .5 .8 .85]); 
 else
    [win, winRect]=Screen('OpenWindow',0,[255 255 255]);
 end
 if(~DEBUG), HideCursor;end
 for blocknumber=1:nBlocks
    for typenum=nFrames(randperm(5))
        dotsize = 20;
        xy = [dotsize (winRect(3)-dotsize);dotsize dotsize];
        soundFileName= 'Ping - Sound Effect.mp3';
        repetitions = 1;
        InitializePsychSound;
        [y, freq]=audioread(soundFileName);
        soundData= y';
        nChannels= size(soundData,1);
        pahandle=PsychPortAudio('Open', [], [], 0, freq, nChannels);
        pahandle=PsychPortAudio('Open', [], [], 0, [], nChannels);
        PsychPortAudio('FillBuffer', pahandle, soundData);
        lessFrames=15;
        Screen('DrawDots',win,xy,dotsize,[0 0 255],[0,0],1);
        Screen('Flip',win);
        WaitSecs(2);    

        moveDown = (winRect(3)-dotsize)/typenum;
        moveSide = (winRect(4)-dotsize)/typenum;

        for i =1:typenum
            xy = [(moveDown*i) (winRect(3)-(moveDown*i));(moveSide*i) (moveSide*i)];
            Screen('DrawDots',win,xy,dotsize,[0 0 255],[0,0],1);
            if i==(nFrames/2 - lessFrames)
                t0= PsychPortAudio('Start', pahandle, repetitions, 0, 1);
            end
            Screen('Flip',win);
            WaitSecs(0.001);
        end
        fprintf('Watch the balls in motion, see if you can detect if the balls collide with one another, or if they pass through each other.\n');
        result=input('Press <1> or <0>\n');
        if (result~=0 || result~=1)
            result=2;
        end
        nTrial=nTrial+1;
        totalResult(nTrial,1)=result;
        totalResult(nTrial,2)=typenum;
    end
 end
 
%File Save
ShowCursor
if(~DEBUG),ListenChar(0); end
sca;
save(outFileName, 'totalResult')
