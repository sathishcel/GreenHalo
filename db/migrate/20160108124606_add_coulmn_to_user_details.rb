class AddCoulmnToUserDetails < ActiveRecord::Migration
  def change
  	    add_column :user_details, :user_id, :integer
  	    add_column :user_details, :material_display, :integer
  	   
  end
end
