# coding: utf-8

class CreateEnglishBrochures < ActiveRecord::Migration
  def change
    create_table :english_brochures do |t|
      t.string :topic
      t.string :name
      t.integer :group_id
      t.string :link
      t.text :content
      t.string :PDF_link

      t.timestamps
    end
  end
end
