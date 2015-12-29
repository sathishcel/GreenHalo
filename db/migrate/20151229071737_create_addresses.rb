class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :zip
      t.string :street
      t.string :suit_unit
      t.string :city
      t.string :state
      t.string :country
      t.string :phone_number
      t.string :full_address
    end
  end
end
