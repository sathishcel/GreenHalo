class DashboardsController < ApplicationController
  SUBLEVELCONSTANT = nil

  def dashboard_1
  end

  def dashboard_2
    @sub_level = SUBLEVELCONSTANT
  end

  def dashboard_3
    @extra_class = "sidebar-content"
  end

  def dashboard_4
    render :layout => "layout_2"
  end

  def dashboard_4_1
  end

  def dashboard_5
  end

  def tracking
     @main_levels = Level.where(:level_id => 0)
  end

  def organize

  end

  def tools

  end

  def getting_sub_levels

  end

end
