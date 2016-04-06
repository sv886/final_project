class Group < ActiveRecord::Base

  belongs_to :user

  validates :class_time, :coach_first_name, :coach_last_name, presence: true

end
