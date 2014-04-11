class AddLanguageToBrochures < ActiveRecord::Migration
  def change
  	add_column :brochures, :language, :integer
  end
end