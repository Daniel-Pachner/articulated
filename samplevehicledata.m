function vdata = samplevehicledata

  dim = zeros(1, 8);
  type = zeros(1, 8);
  
  dim(1) = 0;     type(1) = pointtype('end');
  dim(2) = 5;     type(2) = pointtype('pivot');
  dim(3) = 15;    type(3) = pointtype('pivot');
  dim(4) = 18;    type(4) = pointtype('joint');
  dim(5) = 25;    type(5) = pointtype('pivot');
  dim(6) = 32;    type(6) = pointtype('joint');
  dim(7) = 39;    type(7) = pointtype('pivot');
  dim(8) = 45;    type(8) = pointtype('end');
  
  marks = struct(...
  'dim', num2cell(dim), 'type', num2cell(type));

  units(1) = struct(...
  'x', [0, 18, 18, 0, 0], ...
  'y', [1.0, 1.0, -1.0, -1.0, 1.0], ...
  'a', 1, 'b', 4); 
  
  units(2) = struct(...
  'x', [18, 32, 32, 18, 18], ...
  'y', [1.0, 1.0, -1.0, -1.0, 1.0], ...
  'a', 4, 'b', 6);   

  units(3) = struct(...
  'x', [32, 45, 45, 32, 32], ...
  'y', [1.0, 1.0, -1.0, -1.0, 1.0], ...
  'a', 6, 'b', 8); 

  vdata = struct('marks', marks, 'units', units);
end
