class AddHeightToMembers < ActiveRecord::Migration
  def change
    add_column :members, :height_inches, :integer
  end
end
