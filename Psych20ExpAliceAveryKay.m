%experiment code space :D
%change nubmer 2
%chang3 
% Nice lesson link for drawing dots:
% http://www.mbfys.ru.nl/~robvdw/DGCN22/PRACTICUM_2011/LABS_2011/ALTERNATIVE_LABS/Lesson_2.html

sizeScreen = get(0,'ScreenSize');
sizeScreen = [sizeScreen(3:end),sizeScreen(3:end)];
[win1 ,winRect1] = Screen('OpenWindow',0,[255 255 255],sizeScreen.*[.2 .6 .8 .95]);

DrawDotsFunc(200, win1, winRect1);



