class TipsController < ApplicationController

  def index
    if request.xhr?
      render partial:"tip_listing"
    end
  end
end
