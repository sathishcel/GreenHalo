class ProgramSettingsController < ApplicationController
 def recycling_target
    if request.xhr?
      render partial: "recycling_target"
    end
 end

 def data_entry
   if request.xhr?
     render partial:"data_entry"
   end
 end

end
