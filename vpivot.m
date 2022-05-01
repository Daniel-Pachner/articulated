function p = vpivot(v)
  n = numel(v.marks);
  p = 0;
  for i = 1 : n-1
    if v.marks(i).type == pointtype('pivot') && v.marks(i+1).type == pointtype('pivot')
      p = i;
    end
  end
  if p == 0
    return;
  end
end
