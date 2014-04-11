class RenameEnglishBrochuresToBrochures < ActiveRecord::Migration
  def change
  	rename_table :english_brochures, :brochures
  end
end
