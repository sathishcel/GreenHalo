class ProjectTypesController < ApplicationController
  def index
    render partial:"project_listing"
  end
end