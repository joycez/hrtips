# coding: utf-8

class CreateSpanishBrochures < ActiveRecord::Migration
  def change
    create_table :spanish_brochures do |t|
      t.string :topic
      t.string :name
      t.integer :group_id
      t.string :link
      t.text :content
      t.string :pdf_link
      t.text :author_hist
      t.integer :admin_id

      t.timestamps
    end
  end
end
