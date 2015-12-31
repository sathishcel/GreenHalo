class Business::LoginsController < ApplicationController
  layout "signup"

  def get_zipcode
    if params[:business] == "true"
      @signup_type = "Business"
    else
      @signup_type = "Government"
    end

    session[:business_user_zipcode], session[:location]  = nil
    render :nothing => false, :status => 422
  end

end
