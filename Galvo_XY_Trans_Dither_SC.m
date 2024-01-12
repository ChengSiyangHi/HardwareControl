clear; 
clc;

%% Load DAQ system and connect the galvo
if exist('init','var')
    init = 1; 
else
    init = 0; 
end

% if daq board not initialized/galvo is not connected, then
% initialize/connect
if init == 0
    disp('Connecting devices...')
    galvoY = daq('ni');
    addoutput(galvoY,'Dev1','ao0','Voltage');
    disp('galvoX connected');
    galvoX = daq('ni');
    addoutput(galvoX,'Dev1','ao1','Voltage');
    disp('galvoY connected');    
    init = 1; 
end

%% Initialize the galvo mirrors to voltage = 0
%moving galvoX using write function (value is how many volts are being
%sent)
%galvoX.Rate = 1000; 
%x = 0:0.001:2*pi;
%y = (x);
%outputData = y';
write(galvoX,0)

%moving galvoY using write function (value is how many volts are being
%sent)
%galvoY.Rate = 1000; 
%x = 0:0.001:2*pi;
%y = (x);
%outputData = y';
write(galvoY,0)

%% Send a user defined signal to the galvo
transX = 0;
transY = 0;

DitherY = 0.5;
DitherYtime = 0.1; % Time period of the dithering (second)
DitherYround = 100; % Rounds of the dithering

% Dither galvo Y with a time-dependant sine function
t = 0:0.01:DitherYround*DitherYtime; 
Y = transY+DitherY*sin(t/DitherYtime*2*pi);

SignalY = transY+Y';
tic
for i=1:size(SignalY,1)
    % write(galvoY,SignalY(i,1));
    SignalY(i,1)
    pause(0.01);
end
toc
% write(galvoY,SignalY)
