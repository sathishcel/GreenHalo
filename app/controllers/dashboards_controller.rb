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
     @main_levels = Level.top_levels
  end

  def organize

  end

  def tools

  end

  def new_tracking
   @all_levels = Level.top_levels
  end

  def getting_sub_levels
     level = Level.find(params[:id])
     @sub_levels = level.try(:sub_levels)
  end

end
