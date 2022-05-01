v = readvdata('tram34Tdata.tabulka');

r = 20;
nsegments = 32;
d = 60;
p = circularpath (r, d, nsegments);

close('all')
figure(1)
ax = plotpath([], p, 'k');
hold(ax, 'on')

verbose = true;
direction = 1;
hf = p(end).s*0.5;
pf = pointonpath(p, hf);
plotpath(ax, pf, 'ro');
[v, h] = putvehiclefront(p, v, hf, direction, 1, verbose);
plotvehicle(ax, v, true, true, true, 'k');
