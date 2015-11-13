%experiment code space :D
%change nubmer 2
%chang3 
% Nice lesson link for drawing dots:
% http://www.mbfys.ru.nl/~robvdw/DGCN22/PRACTICUM_2011/LABS_2011/ALTERNATIVE_LABS/Lesson_2.html

sizeScreen = get(0,'ScreenSize');
sizeScreen = [sizeScreen(3:end),sizeScreen(3:end)];
[win ,winRect] = Screen('OpenWindow',0,[255 255 255],sizeScreen.*[0.4 0.4 0.4 0.4]);

DrawDotsFunc(200, win, winRect);



