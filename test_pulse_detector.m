clear;
clc;
clf;

numSubTests = 100;

% Generate a test signal 1
disp('');
disp('');
disp('*********************** Test Signal 1 ***********************');
numCalibrationSamples = 1000;
slope = 0.02;
offset = 10;
pulseWidth = 100;
pulseHeight = 25;
numPulses = 0;
noiseRange = 7;

for ndx = 1:numSubTests
    y = generate_test_signal(numCalibrationSamples, slope, offset, pulseWidth, pulseHeight, numPulses, noiseRange);
    
    % Detect the pulses
    [processedData, estimatedPulseHeight, estimatedStdOfNoise, estimatedNumPulses, estimatedPulseWidth] = ...
        detect_pulses(y, numCalibrationSamples);
    
    % Plot the test signal and processed data
    if (ndx == 1)
        clf;
        plot(y,'k');
        hold on;
        plot(processedData, 'g');
        grid on;
    end
    
    % Display the validation results
    if round(numPulses) ~= round(estimatedNumPulses)
        disp(['INCORRECT:  Number of pulses.  Actual = ' num2str(numPulses) ', Estimated = ' num2str(estimatedNumPulses)] );
    end
    
    stdOfNoise = std(noiseRange*rand(1,numCalibrationSamples));
    if abs(stdOfNoise - estimatedStdOfNoise) > abs(0.1*stdOfNoise)
        disp(['INCORRECT:  Noise level detection.  Actual = ' num2str(stdOfNoise) ', Estimated = ' num2str(estimatedStdOfNoise)] );
    end
    
    if numPulses > 0
        if abs(pulseHeight - estimatedPulseHeight) > abs(0.1*pulseHeight)
            disp(['INCORRECT:  Pulse height.  Actual = ' num2str(pulseHeight) ', Estimated = ' num2str(estimatedPulseHeight)] );
        end
        
        if round(pulseWidth) ~= round(estimatedPulseWidth)
            disp(['INCORRECT:  Pulse width.  Actual = ' num2str(pulseWidth) ', Estimated = ' num2str(estimatedPulseWidth)] );
        end
    end
    
end


% Generate a test signal 2
disp('');
disp('');
disp('*********************** Test Signal 2 ***********************');
numCalibrationSamples = 1000;
slope = -0.01;
offset = 20;
pulseWidth = 80;
pulseHeight = 15;
numPulses = floor(4 + (7-4)*rand(1,1));
noiseRange = 4;

for ndx = 1:numSubTests
    y = generate_test_signal(numCalibrationSamples, slope, offset, pulseWidth, pulseHeight, numPulses, noiseRange);
    
    % Detect the pulses
    [processedData, estimatedPulseHeight, estimatedStdOfNoise, estimatedNumPulses, estimatedPulseWidth] = ...
        detect_pulses(y, numCalibrationSamples);
    
    % Plot the test signal and processed data
    if (ndx == 1)
        clf;
        plot(y,'k');
        hold on;
        plot(processedData, 'g');
        grid on;
    end
    
    % Display the validation results
    if round(numPulses) ~= round(estimatedNumPulses)
        disp(['INCORRECT:  Number of pulses.  Actual = ' num2str(numPulses) ', Estimated = ' num2str(estimatedNumPulses)] );
    end
    
    stdOfNoise = std(noiseRange*rand(1,numCalibrationSamples));
    if abs(stdOfNoise - estimatedStdOfNoise) > abs(0.1*stdOfNoise)
        disp(['INCORRECT:  Noise level detection.  Actual = ' num2str(stdOfNoise) ', Estimated = ' num2str(estimatedStdOfNoise)] );
    end
    
    if numPulses > 0
        if abs(pulseHeight - estimatedPulseHeight) > abs(0.1*pulseHeight)
            disp(['INCORRECT:  Pulse height.  Actual = ' num2str(pulseHeight) ', Estimated = ' num2str(estimatedPulseHeight)] );
        end
        
        if round(pulseWidth) ~= round(estimatedPulseWidth)
            disp(['INCORRECT:  Pulse width.  Actual = ' num2str(pulseWidth) ', Estimated = ' num2str(estimatedPulseWidth)] );
        end
    end
    
end


% Generate a test signal 3
disp('');
disp('');
disp('*********************** Test Signal 3 ***********************');
numCalibrationSamples = 1000;
slope = 0.04;
offset = 10;
pulseWidth = 125;
pulseHeight = 16;
numPulses = floor(2 + (6-2)*rand(1,1));
noiseRange = 5;

for ndx = 1:numSubTests
    y = generate_test_signal(numCalibrationSamples, slope, offset, pulseWidth, pulseHeight, numPulses, noiseRange);
    
    % Detect the pulses
    [processedData, estimatedPulseHeight, estimatedStdOfNoise, estimatedNumPulses, estimatedPulseWidth] = ...
        detect_pulses(y, numCalibrationSamples);
    
    % Plot the test signal and processed data
    if (ndx == 1)
        clf;
        plot(y,'k');
        hold on;
        plot(processedData, 'g');
        grid on;
    end
    

    
    % Display the validation results
    if round(numPulses) ~= round(estimatedNumPulses)
        disp(['INCORRECT:  Number of pulses.  Actual = ' num2str(numPulses) ', Estimated = ' num2str(estimatedNumPulses)] );
    end
    
    stdOfNoise = std(noiseRange*rand(1,numCalibrationSamples));
    if abs(stdOfNoise - estimatedStdOfNoise) > abs(0.1*stdOfNoise)
        disp(['INCORRECT:  Noise level detection.  Actual = ' num2str(stdOfNoise) ', Estimated = ' num2str(estimatedStdOfNoise)] );
    end
    
    if numPulses > 0
        if abs(pulseHeight - estimatedPulseHeight) > abs(0.1*pulseHeight)
            disp(['INCORRECT:  Pulse height.  Actual = ' num2str(pulseHeight) ', Estimated = ' num2str(estimatedPulseHeight)] );
        end
        
        if round(pulseWidth) ~= round(estimatedPulseWidth)
            disp(['INCORRECT:  Pulse width.  Actual = ' num2str(pulseWidth) ', Estimated = ' num2str(estimatedPulseWidth)] );
        end
    end
    
end

% Generate a test signal 4
disp('');
disp('');
disp('*********************** Test Signal 4 ***********************');
numCalibrationSamples = 1000;
slope = 0.05;
offset = 10;
pulseWidth = 60;
pulseHeight = 30;
numPulses = 4;
noiseRange = 10;

for ndx = 1:numSubTests
    y = generate_test_signal(numCalibrationSamples, slope, offset, pulseWidth, pulseHeight, numPulses, noiseRange);
    
    % Detect the pulses
    [processedData, estimatedPulseHeight, estimatedStdOfNoise, estimatedNumPulses, estimatedPulseWidth] = ...
        detect_pulses(y, numCalibrationSamples);
    
    % Plot the test signal and processed data
    if (ndx == 1)
        clf;
        plot(y,'k');
        hold on;
        plot(processedData, 'g');
        grid on;
    end
    
    % Display the validation results
    if round(numPulses) ~= round(estimatedNumPulses)
        disp(['INCORRECT:  Number of pulses.  Actual = ' num2str(numPulses) ', Estimated = ' num2str(estimatedNumPulses)] );
    end
    
    stdOfNoise = std(noiseRange*rand(1,numCalibrationSamples));
    if abs(stdOfNoise - estimatedStdOfNoise) > abs(0.1*stdOfNoise)
        disp(['INCORRECT:  Noise level detection.  Actual = ' num2str(stdOfNoise) ', Estimated = ' num2str(estimatedStdOfNoise)] );
    end
    
    if numPulses > 0
        if abs(pulseHeight - estimatedPulseHeight) > abs(0.1*pulseHeight)
            disp(['INCORRECT:  Pulse height.  Actual = ' num2str(pulseHeight) ', Estimated = ' num2str(estimatedPulseHeight)] );
        end
        
        if round(pulseWidth) ~= round(estimatedPulseWidth)
            disp(['INCORRECT:  Pulse width.  Actual = ' num2str(pulseWidth) ', Estimated = ' num2str(estimatedPulseWidth)] );
        end
    end
end
