class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.integer :member_id
      t.string :photo_id
      t.integer :weight
      t.integer :bicep_circ
      t.integer :forearm_circ
      t.integer :chest_circ
      t.integer :waist_circ
      t.integer :abdomen_circ
      t.integer :hips_circ
      t.integer :thigh_circ
      t.integer :calf_circ
      t.integer :bmi
      t.integer :body_fat_percentage

      t.timestamps null: false
    end
  end
end
