class AddColumnToMembers < ActiveRecord::Migration
  def change
    add_column :members, :status, :string, default: "Active"
  end
end
