class ProgramSettingsController < ApplicationController
 def recycling_target
    if request.xhr?
      render partial: "recycling_target"
    end
  end
end
