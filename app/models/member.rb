class Member < ActiveRecord::Base

  belongs_to :group

  validates :member_first_name, :member_last_name, :age, :gender, presence: true

end
