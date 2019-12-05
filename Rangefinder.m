function rangedfft = Rangefinder(transform, low, high)

for l=1:max(size(transform))
    if l <= low
        transform(l) = 0;
    end
    if l >= high
        transform(l) = 0;
    end
end
rangedfft = transform;

end