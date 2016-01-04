class BusinessLevelSettingsController < ApplicationController
  def index
    if request.xhr?
      render partial:"system_config"
    end
  end

  def terms_conditions
    render partial: "terms_conditions"
  end

  def franchise_aggrement
    render partial: "franchise_aggrement"
  end
end

