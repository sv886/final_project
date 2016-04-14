class Measurement < ActiveRecord::Base

  belongs_to :member

  validates  :member_id, :weight, :bicep_circ, :forearm_circ, :chest_circ, :waist_circ, :abdomen_circ, :hips_circ, :thigh_circ, :calf_circ, :bmi, :body_fat_percentage, presence: true
  attachment :photo

  def height_feet
    "#{height_inches/12}' #{height_inches%12}\""
  end

end
