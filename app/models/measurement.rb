class Measurement < ActiveRecord::Base

  belongs_to :member

  validates  :weight, :bicep_circ, :forearm_circ, :chest_circ, :waist_circ, :abdomen_circ, :hips_circ, :thigh_circ, :calf_circ, :bmi, :body_fat_percentage, presence: true
  attachment :photo

end
