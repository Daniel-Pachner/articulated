r = 40;
nsegments = 15;

D = 35;
phi = linspace(0, D/r, nsegments);
x = r*cos(phi);
y = r*sin(phi);

##x = linspace(0, D, 4);
##y = zeros(size(x));

p = pointpath (x, y);

close('all')
figure(1)
ax = plotpath([], p, 'k');
hold(ax, 'on')

verbose = false;
dim = zeros(1, 7);
type = zeros(1, 4);

dim(1) = 0;     type(1) = pointtype('pivot');
dim(2) = 10;    type(2) = pointtype('pivot');
dim(3) = 15;    type(3) = pointtype('joint');
dim(4) = 20;    type(4) = pointtype('pivot');
dim(5) = 25;    type(5) = pointtype('joint');
dim(6) = 30;    type(6) = pointtype('pivot');
dim(7) = 35;    type(7) = pointtype('end');

backbone_static = struct('dim', num2cell(dim), 'type', num2cell(type));

backbone = pointpath(NaN(1, 7), NaN(1, 7));

direction = -1;
if direction == 1
  h1 = 0;
  backbone(1) = pointonpath(p, h1);
  backbone(2) = findpivottopivot(p, h1, backbone_static(2).dim - backbone_static(1).dim, 1);
  backbone(3) = findextrap(backbone(1), backbone(2), backbone_static(3).dim - backbone_static(2).dim);
  backbone(4) = backtotrack(p, backbone(3), backbone_static(4).dim - backbone_static(3).dim, ...
  backbone(2).s + backbone_static(3).dim - backbone_static(2).dim, 1);
  backbone(5) = findextrap(backbone(3), backbone(4), backbone_static(5).dim - backbone_static(4).dim);
  backbone(6) = backtotrack(p, backbone(5), backbone_static(6).dim - backbone_static(5).dim, ...
  backbone(4).s + backbone_static(5).dim - backbone_static(4).dim, 1);
  backbone(7) = findextrap(backbone(5), backbone(6), backbone_static(7).dim - backbone_static(6).dim);
else
  h1 = D;
  backbone(1) = pointonpath(p, h1);
  backbone(2) = findpivottopivot(p, h1, backbone_static(2).dim - backbone_static(1).dim, -1);
  backbone(3) = findextrap(backbone(1), backbone(2), backbone_static(3).dim - backbone_static(2).dim);
  backbone(4) = backtotrack(p, backbone(3), backbone_static(4).dim - backbone_static(3).dim, ...
  backbone(2).s - (backbone_static(3).dim - backbone_static(2).dim), -1);
  backbone(5) = findextrap(backbone(3), backbone(4), backbone_static(5).dim - backbone_static(4).dim);
  backbone(6) = backtotrack(p, backbone(5), backbone_static(6).dim - backbone_static(5).dim, ...
  backbone(4).s - (backbone_static(5).dim - backbone_static(4).dim), -1);
  backbone(7) = findextrap(backbone(5), backbone(6), backbone_static(7).dim - backbone_static(6).dim);
end

plotpath(ax, backbone, 'b-');
