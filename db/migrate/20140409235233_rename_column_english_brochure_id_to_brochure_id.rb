# coding: utf-8

class RenameColumnEnglishBrochureIdToBrochureId < ActiveRecord::Migration
  def change
  	rename_column :brochures_resources, :english_brochure_id, :brochure_id
  end
end
