function markbackbone(ax, v)
  if isempty(ax)
    ax = gca;
    hold(ax, 'on');
  end
  for i = 1 : numel(v.backbone)
    switch v.marks(i).type 
      case pointtype('pivot')
        plot(v.backbone(i).x, v.backbone(i).y, 'rs', 'MarkerSize', 5);
      case pointtype('joint')
        plot(v.backbone(i).x, v.backbone(i).y, 'go', 'MarkerSize', 5);
      end
    end
end
