function [v, h] = putvehiclefront (p, v, h, direction, endid, ...
  verbose = false, plotlims = false)
  w = alongpath(p, h);
  n = numel(v.marks);
  piv = vpivot(v);
  ends = find([v.marks.type] == pointtype('end'));
  if endid == 1
    m = ends(1);
  else
    m = ends(2);   
  end
  d = v.marks(piv).dim - v.marks(m).dim;
  hl = h + d*0.5*direction;
  hr = h + d*2.0*direction;   
  f = @(h) value(p, w, h, v, direction, m, piv);
  
  if plotlims
    ax = plotpath([], p);
    v.backbone = putbackbone(p, v, hl, direction);
    plotpath(gca, v.backbone, 'g'); 
    v.backbone = putbackbone(p, v, hr, direction);
    plotpath(gca, v.backbone, 'r'); 
  end
  
  h = pointsolver(hl, hr, f, verbose);
  v.backbone = putbackbone(p, v, h, direction, verbose);
  v.tunits = transfunits(v);
end

function val = value(p, w, h, v, direction, m, piv)
  v.backbone = putbackbone(p, v, h, direction);
  val = v.backbone(m).x*w(1) + v.backbone(m).y*w(2) + w(3);
end
