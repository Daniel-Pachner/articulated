function tu = passsection(p, v, direction, ...
    verbose = false, plotfigure = true, animation = false)

ax = gca;
    
midh = p(end).s/2;
midp = pointonpath(p, midh);

[v1, h1] = putvehiclefront(p, v, midh, direction, 1, verbose);
[v2, h2] = putvehiclefront(p, v, midh, direction, 2, verbose);
ison = isontracks(p, v1) && isontracks(p, v2);

tu = tunnel(midp); 
tu.s = midh;

for h = linspace(h1, h2, 40)
  v = shiftvehicle(p, v, h, direction, verbose);
  tu = putvehicletotunnel(p, tu, v, h, direction);
  if animation
    plotvehicle(ax, v);
  end
end

if plotfigure
  ax = plotpath([], p, 2, 'k');
  hold(ax, 'on')
  plotpath(ax, midp, 1, 'ro', 'markersize', 3);
  plotvehicle(ax, v1, false, false, false, 'g');
  plotvehicle(ax, v2, false, false, false, 'b');
  plottunnel(ax, tu, 'ro', 'markersize', 3, 'markerfacecolor', 'r');
  if ison
    fprintf('vehicle is not on tracks\n');
  end
end
