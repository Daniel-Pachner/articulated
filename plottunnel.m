function ax = plottunnel(ax, tu, varargin)
  ne = isempty(ax);;
  if ne
    ax = gca;
  end
  if numel(varargin) > 0
    plot(ax, [tu(:).xl], [tu(:).yl], varargin{:}, ...
    [tu(:).xr], [tu(:).yr], varargin{:});
  else
    plot(ax, [tu(:).xl], [tu(:).yl], 'g-', 'linewidth', 2, ...
    [tu(:).xr], [tu(:).yr], 'r-', 'linewidth', 2);
  end
  if ne
    axis(ax, 'equal');    
  end
end
  
