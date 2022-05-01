function backbone = putbackbone(p, v, h, direction, verbose = false)
  n = numel(v.marks);
  backbone = pointpath(NaN(1, n), NaN(1, n));
  pivot = vpivot(v);
  backbone(pivot) = pointonpath(p, h);  
  backbone(pivot).s = h;
  backbone(pivot + 1) = findpivottopivot(p, h, ...
  v.marks(pivot+1).dim - v.marks(pivot).dim, direction, verbose);
  for i = pivot + 2 : n
    if v.marks(i).type == pointtype('pivot')
      d = v.marks(i).dim - v.marks(i-1).dim;
      f = v.marks(i-1).dim - v.marks(i-2).dim;
      backbone(i) = backtotrack(p, ...
      backbone(i-1), d, ...
      backbone(i-2).s + direction*f*1.5, direction);
    elseif v.marks(i).type == pointtype('joint') || v.marks(i).type >= pointtype('end')
      backbone(i) = findextrap(backbone(i-2), backbone(i-1), ...
      v.marks(i).dim - v.marks(i-1).dim);        
    end
  end
  for i = pivot-1 : -1 : 1
    if v.marks(i).type == pointtype('pivot')
      d = v.marks(i+1).dim - v.marks(i).dim;
      f = v.marks(i+2).dim - v.marks(i+1).dim;
      backbone(i) = backtotrack(p, ...
      backbone(i+1), d, ...
      backbone(i+2).s - direction*f*1.5, -direction, verbose);
    elseif v.marks(i).type == pointtype('joint') || v.marks(i).type >= pointtype('end')
      backbone(i) = findextrap(backbone(i+2), backbone(i+1), ...
      v.marks(i+1).dim - v.marks(i).dim);        
    endif
  end
end

