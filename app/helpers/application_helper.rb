module ApplicationHelper
  def flash_class(level)
    case level.to_sym
      when :success then 'alert alert-success alert-dismissible'
      when :notice then 'alert alert-info alert-dismissible'
      when :alert then 'alert alert-warning alert-dismissible'
      when :error then 'alert alert-danger alert-dismissible'
    end
  end

  def visibility_icon(comb)
    case (comb.is_a?(Comb) ? comb.visibility.to_sym : comb.to_sym)
    when :draft then 'glyphicon-edit'
    when :personal then 'glyphicon-eye-close'
    when :hive_shared then 'glyphicon-eye-open'
    when :world_shared then 'glyphicon-globe'
    end
  end
end
