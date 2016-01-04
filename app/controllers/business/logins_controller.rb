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

  def get_city_and_state
    zip_population = []
    location = Geokit::Geocoders::GoogleGeocoder.geocode "#{params[:zipcode]}"
    zip_population.push(location.latitude,location.longitude,location.state,location.city)
    render :json => zip_population
  end

  def get_location_from_zipcode
    zipcode = ZipCode.check_valid_zipcode(params[:business_user_zipcode])
    if zipcode.present? && zipcode.zip.present?
      session[:business_user_zipcode] = zipcode
      #redirect_to new_business_login_path
      render :json => {user:{zipcode:params[:business_user_zipcode], city:params[:city], state:params[:state]}}
    else
      flash[:alert] = 'Enter Valid ZipCode'
      redirect_to get_zipcode_business_logins_path
    end
  end

end
