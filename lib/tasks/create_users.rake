namespace :db do
  desc "Create User records in the database for demo"
  task 'create_users' => :environment do
    begin


      government_user = User.new(email: "government@wastetracking.com", password: "12345678", first_name: 'Green', last_name: 'Worx')
      government_user.save

    rescue Exception => exception
      puts "*** WARNING: Could not delete - #{exception.message}"
    end
  end
end

