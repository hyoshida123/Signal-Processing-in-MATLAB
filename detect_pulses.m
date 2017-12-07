% Hideaki Yoshida
function [processedData, pulseHeight, stdOfNoise, numPulses, pulseWidth] = detect_pulses(y, numCalibrationSamples)
    % Find the slope and intercept of the linear trend.
    p = polyfit(1:numCalibrationSamples,y(1:numCalibrationSamples),1);
    slope = p(1);
    intercept = p(2);
    % processedData = y - Trend Line; to detrend y.
    processedData = y - (slope * (1:length(y)) + intercept);
    noiseRange = max(processedData(1:numCalibrationSamples)) - min(processedData(1:numCalibrationSamples));
    % locPulseHeight will look like square waves.
    locPulseHeight = processedData > 2 * noiseRange;
    pulseHeight = mean(processedData(locPulseHeight));
    stdOfNoise = std(processedData(1:numCalibrationSamples));
    
    % Count the number of pulses.
    numPulses = 0;
    processedData_diff = diff(processedData > 2 * noiseRange);
    for i = 1:length(processedData_diff)
        if processedData_diff(i) > 0
            numPulses = numPulses + 1;
        end
    end
    
    pulseWidth = sum(abs(processedData) > 2 * noiseRange) / numPulses;
end