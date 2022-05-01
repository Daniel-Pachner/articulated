function plotvehicle(ax, v, markfront = false, ...
    markbone = false, markpivot = false, varargin)
    ne = isempty(ax) || ~isaxes(ax);
    if ne
        ax = gca;
    end    
    hold(ax, 'on')
    for k = 1 : numel(v.units)
        plot(ax, v.tunits(k).x, v.tunits(k).y, varargin{:})
    end
    if markbone
        plot(ax, [v.backbone.x], [v.backbone.y], 'k-.');
        markbackbone(ax, v); 
    end
    if markpivot
        p = vpivot(v);
        plot(ax, v.backbone(p).x, v.backbone(p).y, 'rx');
    end
    if markfront
        hx = text(ax, v.backbone(1).x, v.backbone(1).y, 'front');
        set(hx, 'backgroundcolor', [1, 1, 1]);
        hx = text(ax, v.backbone(end).x, v.backbone(end).y, 'end');
        set(hx, 'backgroundcolor', [1, 1, 1]);  
    end
    axis(ax, 'equal')
    hold(ax, 'on')
end
