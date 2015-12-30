class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.string :position
      t.string :company_name
      t.string :company_website
      t.string :how_heard
      t.string :units
      t.string :pricing_option
      t.string :payment_option
      t.string :amount

    end
  end
end
