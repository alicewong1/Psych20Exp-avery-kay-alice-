function [output] = DrawDotsFuncTiming(nFrames)
    dotsize = 20;
    xy = [dotsize (winRect(3)-dotsize);dotsize dotsize];
   
    Screen('DrawDots',win,xy,[dotsize],[0 0 255],[0,0],[1]);
    Screen('Flip',win);
    WaitSecs(2);    
    
    time = 5;
    speed = time/nFrames;
        
    moveDown = ((winRect(3)-dotsize)/nFrames)*speed;
    moveSide = ((winRect(4)-dotsize)/nFrames)*speed;
    
    for i = 1:time
        xy = [(moveDown*i) (winRect(3)-(moveDown*i));(moveSide*i) (moveSide*i)];
        Screen('DrawDots',win,xy,[dotsize],[0 0 255],[0,0],[1]);
        Screen('Flip',win);
        WaitSecs(0.001);
    end
    sca;
end