function v = shiftvehicle(p, v, h, direction, verbose = false)
  v.backbone = putbackbone(p, v, h, direction, verbose);
  v.tunits = transfunits(v);
end

