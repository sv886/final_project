class RemoveColumnFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :active, :boolean
  end
end
