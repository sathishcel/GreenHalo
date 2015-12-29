class BusinessLevelSettingsController < ApplicationController
def index
if request.xhr?
      render partial:"system_config"
end
end
end

