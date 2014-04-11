class CreateGlossaries < ActiveRecord::Migration
  def change
    create_table :glossaries do |t|
      t.string :project
      t.string :term
      t.string :source
      t.string :source_label
      t.string :source_year
      t.integer :stats_id
      t.text :definition
      t.integer :language

      t.timestamps
    end
  end
end
