class DashboardsController < ApplicationController
  SUBLEVELCONSTANT = nil
  DEFAULT_LEVEL = 1

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
   if request.xhr?
     @level_limit = params[:multi_level_selection].to_i
     respond_to do |format|
       format.js { render "/dashboards/new_tracking" }
     end
   else
     @wgu_limit = DEFAULT_LEVEL
     render :nothing => false, :status => 422
   end
  end

  def getting_sub_levels
     level = Level.find(params[:id])
     @sub_levels = level.try(:sub_levels)
     @level_wgus = level.try(:wgus)
  end


  def add_more_wgus

  end

  def add_menu_level

  end

  def custom_level_adding

  end

  def custom_wgu_adding

  end

end
