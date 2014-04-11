class AddAdminIdToResource < ActiveRecord::Migration
  def change
    add_column :resources, :admin_id, :integer
  end
end
