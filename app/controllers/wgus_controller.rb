class WgusController < ApplicationController

  def  create
    if params[:wgu].present?
      params[:wgu].keys.each do |u|
        @wgu = Wgu.new(params[:wgu][u].permit(:name, :level_id))
        @wgu.save
      end
    elsif params[:wgu_level].present?
      params[:wgu_level].keys.each do |u|
        @wgu = Wgu.new(params[:wgu_level][u].permit(:name,:wgu_id))
        @wgu.save
      end
      session[:wgu_id] = nil
    end
    
    redirect_to new_tracking_path

  end
end
