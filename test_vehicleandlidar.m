%%v = readvdata('tram34TdataFOVLID.tabulka');
v = readvdata('tram34Tdata_camfov60deg.tabulka');
%%v = readvdata('tram34Tdata_camfov90deg.tabulka');

verbose = true;
r = 20;
nsegments = 30;
d = 1.5*v.marks(end).dim;
p = circularpath (r, d, nsegments);
##v = shiftvehicle(p, v, d/2, 1, verbose);
v = putvehiclefront(p, v, 2, -1, 2, false);

ax = gca;
delete(get(ax, 'children'))
plotfillvehicle(ax, v, [1, 1, 1]*0.7);
hold(ax, 'on');
fill(ax, [v.tunits(5).x], [v.tunits(5).y], [0, 1, 1])
%%fill(ax, [v.tunits(6).x], [v.tunits(6).y], [1, 1, 0])
plotpath(ax, p, 2, 'k', 'linewidth', 2);
plotvehicle(ax, v, false, true, true, 'r')

fovangle = atan(abs(v.units(5).y(1)/v.units(5).x(1)))*180/pi*2;

m = fix(numel(p)/2);
plot([-r, p(m).x], [0, p(m).y], 'k:');
text(mean([-r, p(m).x]), mean([0, p(m).y]), sprintf('R = %0.3g m', r), ...
'backgroundcolor', [1, 1, 1]);
text(ax, mean(v.tunits(5).x), mean(v.tunits(5).y), ...
sprintf('FOV %3.0f', fovangle), ...
'backgroundcolor', [1, 1, 1], 'verticalalignment', 'middle', 'horizontalalignment', 'center');
