class ZipCode < ActiveRecord::Base

  def self.check_valid_zipcode(zip)
   zipcode = Geokit::Geocoders::GoogleGeocoder.geocode zip
   if zipcode.present? && zipcode.zip.present?
     return zipcode
   end
  end

end
