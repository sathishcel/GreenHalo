module DashboardsHelper

  def sub_list_tem(num)
    li_class = num.nil? ? nil : "dd-item"
    return li_class
  end
end
