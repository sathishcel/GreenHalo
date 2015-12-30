class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :name
      t.integer :level_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
