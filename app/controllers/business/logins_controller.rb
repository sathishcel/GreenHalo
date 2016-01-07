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
      render :json => {user:{zipcode:params[:business_user_zipcode], city:params[:city], state:params[:state]}}
    else
      flash[:alert] = 'Enter Valid ZipCode'
      redirect_to get_zipcode_business_logins_path
    end
  end

  def check_user_domain
    domain_values = []
    user_domain = User.where(:domain_name => params[:domain_name]).first
    domain_values.push(user_domain,params[:domain_name])
    render :json => domain_values
  end


  def create

    User.transaction do
      session[:business_user] = nil
      @business_user = User.new(user_params)
      @business_user.skip_confirmation!

      if @business_user.save
        @address = Address.new(address_params)
        @address.entity_type="User"
        @address.entity_id=@business_user.id
        if @address.save
          @user_detail = UserDetail.new(user_detail_params)
          @user_detail.user_id = @business_user.id
          if @user_detail.save
            session[:business_user] ||= @business_user.id unless @business_user.nil?
            render json: nil, status: :ok
          end
        end
      else
        flash[:notice] = @business_user.errors.full_messages
        render :new
      end

    end
  end

  private

  def user_params
    params.require(:user).permit(:email,:confirm_email,:first_name,:last_name,:domain_name,:password,:password_confirmation)
  end

  def address_params
    params.require(:address).permit(:street,:suit_unit,:city,:state,:zip,:phone_number)
  end

  def user_detail_params
    params.require(:user_detail).permit(:position,:company_name,:company_website,:how_heard)
  end
end
