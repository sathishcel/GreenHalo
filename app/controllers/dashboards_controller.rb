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
    @user= UserDetail.where("user_id = ?",current_user.id).first
    @user_details = @user.material_display if !@user.blank?
      if @user_details  == 1
        @liquid = 1
      elsif @user_details == 2
        @liquid = 2
      elsif @user_details == 3
        @liquid = 3 
      end
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
     @level = Level.find(params[:id])
  end

  def custom_wgu_adding
    @wgu_level = Level.find(params[:id])
  end


  def add_report_type
    @page = params[:page] if params[:page]
    @select_level = Level.find(params[:id])
  end



  def get_pdf
    @levels   = Level.top_levels
    respond_to do |format|
      format.html
      format.pdf do render  :pdf => "wastetracking.pdf", :template => 'dashboards/get_pdf.html.erb'
      end
    end
  end

  def get_csv
    @levels   = Level.all
    respond_to do |format|
      format.html
      format.csv { send_data @levels.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end
  def get_lequid_only
    update_user_material_display('liquid')
    if request.xhr?
       render partial: "liquid_data_only"
    end
  end

  def get_solid_only
    update_user_material_display('solid')
    if request.xhr?
       render partial: "solid_data_only"
    end
  end

  def get_lequid_and_solid
    update_user_material_display('both')
    if request.xhr?
       render partial: "liquid_and_solid_data"
    end
  end
  def update_user_material_display(params)
    @user= UserDetail.where("user_id = ?",current_user.id).first
    if params == 'liquid'
      if !@user.blank?
        @user.update(:user_id => @user.id,:material_display => 1)
      else
        UserDetail.create(:user_id => current_user.id,:material_display => 1)
      end
    elsif params == 'solid'
      if !@user.blank?
       @user.update(:user_id => @user.user_id,:material_display => 2)
      else
       UserDetail.create(:user_id => current_user.id,:material_display => 2)
      end
    elsif params == 'both'
      if !@user.blank?
        @user.update(:user_id => @user.user_id,:material_display => 3)
      else
        UserDetail.create(:user_id => current_user.id,:material_display => 3)
    end
    end
  end
end
