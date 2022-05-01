function l = pathlength(pth)
  n = numel(pth) - 1;
  l = 0.0;
  for k = 1 : n
    l = l + norm([pth(k+1).x - pth(k).x, pth(k+1).y - pth(k).y]);
  end
end
