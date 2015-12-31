class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.integer :address_id
      t.string  :full_name
      t.string  :company_name
      t.string  :address
      t.string  :state
      t.string  :city
      t.string  :zip

    end
  end
end
