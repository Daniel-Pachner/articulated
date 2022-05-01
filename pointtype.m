function n = pointtype(s)
  switch s
    case 'pivot'
      n = 1;
    case 'joint'
      n = 2;      
    case 'end'
      n = 3;
    otherwise
      n = 0;
  endswitch
end

  
