function [output] = DrawDotsFunc(nFrames)
    dotsize = 50;
    xy = [dotsize (winRect(3)-dotsize);dotsize dotsize];
    Screen('DrawDots',win,xy,[dotsize],[0 0 255],[0,0],[1]);
    Screen('Flip',win);
    WaitSecs(2);    

    moveDown = (winRect(3)-dotsize)/nFrames;
    moveSide = (winRect(4)-dotsize)/nFrames;
    for i =1:nFrames
    xy = [(moveDown*i) (winRect(3)-(moveDown*i));(moveSide*i) (moveSide*i)];
    Screen('DrawDots',win,xy,[dotsize],[0 0 255],[0,0],[1]);
    Screen('Flip',win);
    WaitSecs(0.001);
    end
    sca;
end