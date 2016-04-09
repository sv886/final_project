class Group < ActiveRecord::Base

  belongs_to :user
  has_many :members

  validates :class_time, :coach_first_name, :coach_last_name, presence: true

  def coach_full_name
    "#{coach_first_name} #{coach_last_name}"
  end

end
