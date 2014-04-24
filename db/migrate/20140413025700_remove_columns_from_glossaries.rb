# coding: utf-8

class RemoveColumnsFromGlossaries < ActiveRecord::Migration
  def change
  	remove_column :glossaries, :project
  	remove_column :glossaries, :source
  	remove_column :glossaries, :source_label
  	remove_column :glossaries, :source_year
  	remove_column :glossaries, :stats_id
  end
end
