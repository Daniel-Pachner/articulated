function [xm, ym, it] = pointsolver(xl, xr, f, ...
  verbose = false, niter = 20, eps = 1e-6, strict = true)
  [xl, xr] = sort2(xl, xr, eps);
  
  for it = 1 : niter
        
    yr = f(xr);
    yl = f(xl);
    if verbose
      fprintf('%i x=[%0.3g, %0.3g], y=[%0.3g, %0.3g]', it, xl, xr, yl, yr);
    end
    if sign(yl) ~= sign(yr)
      if verbose
        fprintf(' --> linear step\n');
      end
      step = 1;
      xm = xl - yl * (xr - xl) / (yr - yl);
    else
      if verbose
        fprintf(' --> halving step\n');
      end
      step = 2;
      xm = (xl + xr)/2;
    end
    
    ym = f(xm);
    if abs(ym) <= eps
      break;
    elseif sign(ym) == sign(yl) && step == 1
      xl = xm;
    elseif sign(ym) == sign(yr) && step == 1
      xr = xm;
    elseif abs(yr) > abs(yl) && abs(yr) > abs(ym)
      xr = xm;
    elseif abs(yr) < abs(yl) && abs(yl) > abs(ym)
      xl = xm;
    else
      break;
    end
    
  end
  if verbose
    fprintf('%i x=%0.3g, y=%0.3g (final)\n', it, xm, ym);
  end
  if abs(ym) > 10*eps
    fprintf('Inaccurate pointsolver result: %0.3g after %i iterations\n', ym, it);
  end
end

function [xl, xr] = sort2(xl, xr, eps)
  if xr < xl
    xl_orig = xl;
    xl = xr - eps;
    xr = xl_orig + eps;
  end
end

