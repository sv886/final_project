class Member < ActiveRecord::Base

  belongs_to :group
  has_many :measurements

  validates :group_id, :member_first_name, :member_last_name, :age, :gender, presence: true

  def member_full_name
    "#{member_first_name} #{member_last_name}"
  end

end
