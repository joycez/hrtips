# coding: utf-8

class AddTranslationToBrochures < ActiveRecord::Migration
  def change
    add_column :brochures, :translation, :integer
  end
end
