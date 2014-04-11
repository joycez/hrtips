class RenameEnglishBrochuresResourcesToBrochuresResources < ActiveRecord::Migration
  def change
  	rename_table :english_brochures_resources, :brochures_resources
  end
end
