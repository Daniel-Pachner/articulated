function plotfillvehicle(ax, v, varargin)
    ne = isempty(ax) || ~isaxes(ax);
    if ne
        ax = gca;
    end    
    hold(ax, 'on')
    for k = 1 : numel(v.units)
        fill(ax, v.tunits(k).x, v.tunits(k).y, varargin{:})
    end
    axis(ax, 'equal')
    hold(ax, 'on')
end
