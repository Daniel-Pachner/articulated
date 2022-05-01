##v = readvdata('tram34TdataFOVLID.tabulka');
v = readvdata('tram34Tdata.tabulka');

verbose = true;
r = 18;
nsegments = 30;
d = v.marks(end).dim + 4;
p = circularpath (r, d, nsegments);
##v = shiftvehicle(p, v, d/2, 1, verbose);
v = putvehiclefront(p, v, 2, -1, 2, false);

ax = gca;
plotfillvehicle(ax, v, [1, 1, 1]*0.7);
hold(ax, 'on');
##fill(ax, [v.tunits(5).x], [v.tunits(5).y], [0, 1, 1])
##fill(ax, [v.tunits(6).x], [v.tunits(6).y], [1, 1, 0])
plotpath(ax, p, 2, 'k', 'linewidth', 2);
plotvehicle(ax, v, false, true, true, 'r')
