class CreateBillingDetails < ActiveRecord::Migration
  def change
    create_table :billing_details do |t|
      t.integer :address_id
      t.integer :user_id
      t.integer :user_details
      t.string :card_no
      t.string :card_type
      t.boolean :status
      t.string  :paid_amount
      t.string  :transaction_no
     
    end
  end
end
