function ax = plotpath(ax, p, k = 1, varargin)
    ne = isempty(ax) || ~isaxes(ax);
    if ne
        ax = gca;
    end
    if k == 1
        plot(ax, [p(:).x], [p(:).y], varargin{:});
    else
        [pl, pr] = pathtracks(p);
        plotpath(ax, pr, 1, varargin{:});
        hold(ax, 'on');
        plotpath(ax, pl, 1, varargin{:});    
    end
    axis(ax, 'equal')
end

