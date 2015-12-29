class CreateScheduleDemo < ActiveRecord::Migration
  def change
    create_table :schedule_demos do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.datetime :request_date
      t.string :request_time
      t.string :request_session
      t.string :request_time_zone
    end
  end
end
