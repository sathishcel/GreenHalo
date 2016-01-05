class MaterialsController < ApplicationController
  def material_list
    if request.xhr?
      render partial: "material_list"
    end
  end

  def facility_list
    if request.xhr?
      render partial: "facility_list"
    end
  end

end