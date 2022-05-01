v = readvdata('tram34Tdata.tabulka');

r = 19;
d = 50;
nsegments = 30;
p = circularpath (r, d, nsegments);


##close('all')
figure(1)
ax = plotpath([], p, 2, 'k');
hold(ax, 'on')

verbose = false;

direction = -1;
h = p(end).s;

##direction = 1;
##h = 0;

v = shiftvehicle(p, v, h, direction);
plotvehicle(ax, v, false, false, false, 'r');
