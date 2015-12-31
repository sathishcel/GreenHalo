class LevelsController < ApplicationController
  PARENT_LEVEL = 0

  def new

  end

  def create
    if params[:level].present?
      params[:level].keys.each do |key|
        if params[:level][key][:level_id].present?
          @level = Level.new(params[:level][key].permit(:name, :level_id))
        else
          @level = Level.new(params[:level][key].permit(:name))
          @level.level_id = PARENT_LEVEL
        end
        @level.save
      end
    elsif params[:sub_level].present?
      params[:sub_level].keys.each do |key|
        @level = Level.new(params[:sub_level][key].permit(:name,:level_id))
        @level.save
      end
      session[:wgu_id] = nil
    end
    redirect_to new_tracking_path
  end
end
