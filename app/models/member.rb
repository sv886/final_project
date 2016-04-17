class Member < ActiveRecord::Base

  belongs_to :group
  has_many :measurements

  validates :group_id, :member_first_name, :member_last_name, :age, :gender, presence: true

  def member_full_name
    "#{member_first_name} #{member_last_name}"
  end

  def last_name_first
    "#{member_last_name}, #{member_first_name}"
  end

  def current_results
    measurements.last
  end

  def current_weight
    # map measurements for most current weight result
    measurements.map { |m| m.weight }.last
  end

end
