v = readvdata('tram34Tdata.tabulka');

nsegments = 50;
verbose = false;
plotfigure = true;

figure(1)
n = 11;
d = 2*v.marks(end).dim;
midh = d/2;
c_data = linspace(0, 100/20, n);

for i = 1 : n
  r = 100/c_data(i);
  p = circularpath (r, d, 30);
  v = putvehiclefront(p, v, midh, -1, 1, verbose);  
  plotpath(ax, p, 2, 'k');
  plotvehicle(ax, v, false, false, false, 'r');
  drawnow;
end