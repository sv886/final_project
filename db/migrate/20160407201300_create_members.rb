class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :group_id
      t.string :member_first_name
      t.string :member_last_name
      t.integer :age
      t.string :gender
      t.boolean :active,  default: true
      t.string :notes

      t.timestamps null: false
    end
  end
end
