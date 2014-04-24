# coding: utf-8

class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :p_voice
      t.string :p_fax
      t.string :p_tty
      t.string :p_other
      t.string :p_other_desc
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :url
      t.text :desc
      t.integer :language

      t.timestamps
    end
  end
end
