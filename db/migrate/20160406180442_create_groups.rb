class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.string :class_time
      t.string :coach_first_name
      t.string :coach_last_name

      t.timestamps null: false
    end
  end
end
