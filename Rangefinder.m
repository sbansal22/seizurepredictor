function rangedfft = Rangefinder(transform, low, high)
% Function used to zero high frequency signals
% INPUTS: transform - the FFT vector
%         low - lower index threshold
%         high - higher index threshold
% OUTPUT: rangedfft - FFT vector with zeroed values lower than "low" and
%                     higher than "high"
for l=1:max(size(transform))
    if l <= low % Compare index to the lower value
        transform(l) = 0; % If the index is below the "low" index, zero it
    end
    if l >= high % Compare index to the higher value
        transform(l) = 0; % If the index is larger the "high" index, zero it
    end
end
rangedfft = transform; % Set the output equal to the filtered FFT
end