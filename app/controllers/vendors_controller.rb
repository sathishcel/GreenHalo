class VendorsController < ApplicationController

  def index
      render partial:"vendors_listing"
  end

end
