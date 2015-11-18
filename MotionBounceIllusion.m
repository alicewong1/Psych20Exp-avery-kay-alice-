DEBUG= true;
nBlocks=5;
trialTimeout=5;
nFrames=[100 200 300 400 500];
totalResult=0;
nTrial=0;

%Initializing Sound
soundFileName= 'Ping - Sound Effect.mp3';
repetitions = 1;
InitializePsychSound;
[y, freq]=audioread(soundFileName);
soundData= y';
nChannels= size(soundData,1);

pahandle=PsychPortAudio('Open', [], [], 0, freq, nChannels);
pahandle=PsychPortAudio('Open', [], [], 0, [], nChannels);
PsychPortAudio('FillBuffer', pahandle, soundData);


% Initialize Screen/Results File
 Screen('Preference', 'VisualDebugLevel', 1);
 Screen('Preference', 'SkipSyncTests',1);
 sizeScreen=get(0,'ScreenSize');
 sizeScreen=[sizeScreen(3:end),sizeScreen(3:end)];
 subjInitials = input('Subject''s initials: ','s'); 
 outFileName = ['MotionBounceIllusionResults_' subjInitials '.mat'];
 if exist(outFileName,'file')
     subjInitials=input('Subject Initials already used. Please enter different initials: ', 's');
 end
 fprintf('Watch the balls in motion, press <1> if you see a collision of the two balls, or press ,<0> if it appears that the balls seem to pass through one another in a continuous stream\n');
 input('Press <enter> to begin');
 outFileName = ['MotionBounceIllusionResults_' subjInitials];
 
 %Keyboard SetUp
 KbName('UnifyKeyNames');
 
 %DEBUG set up
 if (DEBUG) 
    [win, winRect]=Screen('OpenWindow',0,[255 255 255]);
 else
    [win, winRect]=Screen('OpenWindow',0,[255 255 255]);
 end
 
 if(~DEBUG), HideCursor;end
 for blocknumber=1:nBlocks
    for typenum=nFrames(randperm(5))
        HideCursor;
        dotsize = 20;
        xy = [dotsize (winRect(3)-dotsize);dotsize dotsize];
        Screen('DrawDots',win,xy,dotsize,[0 0 255],[0,0],1);
        Screen('Flip',win);
        WaitSecs(2);    

        moveDown = (winRect(3)-dotsize)/typenum;
        moveSide = (winRect(4)-dotsize)/typenum;

        for i =1:typenum
            indexNumber=find(nFrames==typenum);
            lessFrames=13*(1/indexNumber);
            xy = [(moveDown*i) (winRect(3)-(moveDown*i));(moveSide*i) (moveSide*i)];
            Screen('DrawDots',win,xy,dotsize,[0 0 255],[0,0],1);
            if i==(round(typenum/2-lessFrames))
                t0= PsychPortAudio('Start', pahandle, repetitions, 0, 1);
            end
            Screen('Flip',win);
            WaitSecs(0.001);
   
        end
        Screen('TextSize',win,25);
        Screen('TextFont',win,'Times');
        Screen('TextStyle',win,1);
        message='Press <1> if the balls collide with one another, press <0> if they stream through each other. After responding, please press enter.';
        txtBounds=Screen('TextBounds',win,message);
        Screen('DrawText',win,message,(winRect(3)-txtBounds(3))/2,(winRect(4)-txtBounds(4))/2,[0,0,0]);
        Screen('Flip',win);
        response=input('Press <1> or <0>\n', 's');    
        while (isempty(response))
        end   
         if (response=='0')
            response=str2num('0')
         elseif (response=='1')
            response=str2num('1')
         else
            response=str2num('2');
        end
        nTrial=nTrial+1;
        totalResult(nTrial,1)=response;
        totalResult(nTrial,2)=typenum;
    end  
 ShowCursor;   
 end
 
%File Save
ShowCursor;
save(outFileName, 'totalResult')
Screen('TextSize',win,25);
Screen('TextFont',win,'Times');
Screen('TextStyle',win,1);
message='Thank you for participating, your responses have been recorded!';
txtBounds=Screen('TextBounds',win,message);
Screen('DrawText',win,message,(winRect(3)-txtBounds(3))/2,(winRect(4)-txtBounds(4))/2,[0,0,0]);
Screen('Flip',win);
WaitSecs(0.5);
ShowCursor;
sca;
ShowCursor;
