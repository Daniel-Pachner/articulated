function ret = stride(p, i, s)
    if s > 0
        range = i : numel(p);
    else
        range = i : -1 : 1;
    end
    for j = 1 : numel(range)
        if abs(p(range(j)).s - p(range(1)).s) > abs(s)
            break
        end
    end
    ret = range(j);
end

