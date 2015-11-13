function[] = AnotherToneGenerator(duration)

cf = 2000;                  % carrier frequency (Hz)
sf = 22050;                 % sample frequency (Hz)
                          
n = sf * duration;                 % number of samples
s = (1:n) / sf;             % sound data preparation
s = sin(2 * pi * cf * s);   % sinusoidal modulation
sound(s, sf);               % sound presentation
pause(duration + 0.5);             % waiting for sound end
end
