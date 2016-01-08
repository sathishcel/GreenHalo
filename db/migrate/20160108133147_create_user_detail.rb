class CreateUserDetail < ActiveRecord::Migration
  def change
    drop_table :user_details
    create_table :user_details do |t|
      t.string :position
      t.string :company_name
      t.string :company_website
      t.string :how_heard
      t.string :units
      t.string :pricing_option
      t.string :payment_option
      t.string :amount
      t.integer :user_id
      t.integer :material_display
    end
  end
end
