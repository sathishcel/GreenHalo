module DashboardsHelper

  def sub_list_tem(num)
    li_class = num.nil? ? nil : "dd-item"
    return li_class
  end

  def tracking_number(level_id)
    o = [(0..9)].map { |i| i.to_a }.flatten
    string = (0...8).map { o[rand(o.length)] }.join
    'GH' + string
  end

  def total_sub_level_count(level_id)
    sub_levels = Level.find(level_id).try(:sub_levels)
    sub_levels_array = sub_levels.map do |child|
      [child] + child.sub_levels
    end.try(:flatten)
    sub_levels_array.blank? ? nil : sub_levels_array.count
  end


  def list_content(level_id)
    level = Level.find(level_id)
    render :partial => 'dashboards/list_popover', :locals =>{:level => level}
  end

  def wgu_list_content(wgu_id)
    wgu = Wgu.find(wgu_id)
    render :partial => 'dashboards/wgu_list_popover', :locals =>{:wgu => wgu}
  end

  def level_wgus_count(level)
    level.wgus.count
  end

  def all_wgus_count(level)
    sub_level_ids = level.get_sub_levels.map(&:id) << level.id
    Wgu.where(level_id:sub_level_ids).count
  end

  def sub_level_count(level)
    level.get_sub_levels.count
  end

  def level_settings_content
    render :partial => 'dashboards/level_settings_popover'
  end
end

