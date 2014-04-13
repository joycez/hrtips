class DeleteLinkFromBrochures < ActiveRecord::Migration
  def change
  	remove_column :brochures, :link
  end
end
