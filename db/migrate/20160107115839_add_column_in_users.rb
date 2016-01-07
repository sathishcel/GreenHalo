class AddColumnInUsers < ActiveRecord::Migration
  def change
     add_column :users, :confirm_email, :string
     add_column :addresses, :entity_type, :string
     add_column :addresses, :entity_id, :integer
     add_column :user_details, :user_id, :integer
  end
end
