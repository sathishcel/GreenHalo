class BusinessLevelSettingsController < ApplicationController
  def index
    if request.xhr?
      @wgu = Wgu.first
      render partial:"system_config"
    end
  end

  def terms_conditions
    render partial: "terms_conditions"
  end

  def franchise_aggrement
    render partial: "franchise_aggrement"
  end

  def bin_types
    if request.xhr?
      render partial: "bin_types"
    end
  end

  def bin_locations
    if request.xhr?
      render partial: "bin_locations"
    end
  end

  def gallery
    if request.xhr?
      render partial: "gallery"
    end
  end

  def contact
    if request.xhr?
      render partial: "contact"
    end
  end

  def overview
    if request.xhr?
      render partial: "overview"
    end
  end

end

