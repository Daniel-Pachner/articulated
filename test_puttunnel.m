v = readvdata('tram34Tdata.tabulka');

nsegments = 30;
r = 20;
d = v.marks(end).dim;
p = circularpath (r, d, nsegments);
tu = tunnel(p);

close('all')
figure(1)
ax = plotpath([], p, 2, 'k', 'linewidth', 5);
hold(ax, 'on')
direction = -1;

modul = 1;
for k = 1 : numel(tu)
  v = shiftvehicle(tu, v, tu(k).s, direction);
  %tu = putvehicletotunnel(p, tu, v, tu(k).s, direction);
  tu = putvehicletotunnel(p, tu, v);
  if k/modul == fix(k/modul)
    plotvehicle(ax, v, false, false, false, 'k');
    drawnow;
  end
  if k == fix(numel(tu))
      plotfillvehicle(ax, v, [1, 1, 1]*0.75);
  end
end
plottunnel(ax, tu);
