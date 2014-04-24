# coding: utf-8

class DropSpanishBrochures < ActiveRecord::Migration
  def change
  	drop_table :spanish_brochures
  end
end
