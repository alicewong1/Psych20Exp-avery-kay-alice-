%experiment code space :D
%change nubmer 2
%chang3 
% Nice lesson link for drawing dots:
% http://www.mbfys.ru.nl/~robvdw/DGCN22/PRACTICUM_2011/LABS_2011/ALTERNATIVE_LABS/Lesson_2.html
sizeScreen = get(0,'ScreenSize');
sizeScreen = [sizeScreen(3:end),sizeScreen(3:end)];
[win,winRect] = Screen('OpenWindow',0,[255 255 255],sizeScreen.*[.2 .6 .8 .95]);

dotsize = 50;
xy = [dotsize (winRect(3)-dotsize);dotsize dotsize];
Screen('DrawDots',win,xy,[dotsize],[0 0 255],[0,0],[1]);
Screen('Flip',win);
WaitSecs(2);


