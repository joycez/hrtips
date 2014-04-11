class CreateEnglishBrochureResourceJoin < ActiveRecord::Migration
  def change
    create_table :english_brochures_resources do |t|
      t.integer :english_brochure_id
      t.integer :resource_id

      t.timestamps
    end
  end
end
