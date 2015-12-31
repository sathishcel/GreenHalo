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

end

