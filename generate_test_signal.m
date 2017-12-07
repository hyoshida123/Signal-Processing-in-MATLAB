function x = generate_test_signal(numCalibrationSamples, slope, offset, pulseWidth, pulseHeight, numPulses, noiseRange)
% function x = generate_test_signal(numCalibrationSamples, slope, offset, pulseWidth, numPulses, pulseHeight, noiseRange)
%
% Returns a signal vector, x, containing a linear trend and pulses.  The signal starts with a calibration period that 
% contains no pulses.  White noise is added to each sample in the signal.
%
% numCalibrationSamples - Length of the calibration period at the start of the signal.  There are no pulses in this part of the signal.
% slope - Slope of the trend line in the signal.
% offset - Amplitude offset of the first sample
% pulseWidth - Number of samples in each pulse
% pulseHeight - Mean pulse height
% numPulses - Number of pulses in the signal
% noiseRange - Amplitude of the white noise that is added to the signal.  
%       The noise added to each sample is noiseRange*rand(1,1) - noiseRange

x = zeros(1, numCalibrationSamples);

for ndx = 1:numPulses
    % Insert a random number of additional zeros (up to 10 pulse widths)
    x = [x zeros(1, int32(rand(1)*5*pulseWidth+10))];
    x = [x pulseHeight * ones(1, pulseWidth)];
end

% Pad some zeros on the end
x = [x zeros(1, int32(rand(1)*5*pulseWidth+10))];

% Add trend line
trendLine = linspace(offset, offset+slope*(length(x) - 1), length(x));
x = x + trendLine;

% Add noise
x = x + rand(1, length(x)) * noiseRange - noiseRange/2;

end