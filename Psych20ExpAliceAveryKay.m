%experiment code space :D
%change nubmer 2
%chang3 
% Nice lesson link for drawing dots:
% http://www.mbfys.ru.nl/~robvdw/DGCN22/PRACTICUM_2011/LABS_2011/ALTERNATIVE_LABS/Lesson_2.html
sizeScreen = get(0,'ScreenSize');
sizeScreen = [sizeScreen(3:end),sizeScreen(3:end)];
[win,winRect] = Screen('OpenWindow',0,[255 255 255],sizeScreen.*[.2 .6 .8 .95]);

xy = [10 (winRect(3)-10);10 10];
Screen('DrawDots',win,xy,[10],[0 0 255],[0,0],[1]);
Screen('Flip',win);
WaitSecs(5);

nFrames = 40;
moveDown = (winRect(3)-10)/nFrames;
moveSide = (winRect(4)-10)/nFrames;
for i =1:nFrames
xy = [(moveDown*i) (winRect(3)-(moveDown*i));(moveSide*i) (moveSide*i)];
Screen('DrawDots',win,xy,[10],[0 0 255],[0,0],[1]);
Screen('Flip',win);
WaitSecs(.2);
end
sca;
