% For testing DAQ board and camera

% Configurate parameters
scanRange = 15;
stepSize = 1;
nFrames_per_step = 20;
exposureTime = 50/1000;

% Load Prime 95B camera
cameraRed = daq.createSession('ni'); % create daq session
addAnalogOutputChannel(cameraRed,'Dev1','ao1','Voltage'); % initialize output port
% cameraGreen = daq.createSession('ni'); % create daq session
% addAnalogOutputChannel(cameraGreen,'Dev1','ao0','Voltage'); % initialize output port
lagTime = 0.05; % after each frame [s]
% disp('Cameras ready.')



%% Test turning on the camera
% pause(2);
% outputSingleScan(cameraRed,5); % start exposure



%% Test taking a ccan
for frameNo = 1:nFrames_per_step
    frameNo
    outputSingleScan(cameraRed,5); % start exposure
    pause(exposureTime); % acquire
    outputSingleScan(cameraRed,0); % finish exposure
    pause(lagTime); % wait
end
outputSingleScan(cameraRed,0); % finish exposure
