%% Configurate parameters
scanRange = input('Scan range? (um)\n');
stepSize = input('Step size? (um)\n');
nFrames_per_step = input('Number of frames at each z?\n');
exposureTime = input('Camera exposure time? (ms)\n')/1000;

% Generate a csv file for EasyDHPSF calibration
bookSize = (scanRange/stepSize+1)*nFrames_per_step;
book = zeros(bookSize,4);
for i=1:nFrames_per_step:((scanRange/stepSize+1)*nFrames_per_step)
    book(i:i+nFrames_per_step-1,4)=scanRange/2-(i-1)/nFrames_per_step*stepSize;
end
for i=1:nFrames_per_step:((scanRange/stepSize+1)*nFrames_per_step)
    book(i,1:3)=-1;
end
writematrix(book,['Z:\ag134\','EasyDHPSF','range',num2str(scanRange),'um_','stepSize',num2str(stepSize),'um_','FramesPerStep',num2str(nFrames_per_step),'.csv']);
