class AddUpdatedByToGlossaries < ActiveRecord::Migration
  def change
  	add_column :glossaries, :updated_by, :integer
  end
end
