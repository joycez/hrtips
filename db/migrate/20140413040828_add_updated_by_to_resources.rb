# coding: utf-8

class AddUpdatedByToResources < ActiveRecord::Migration
  def change
  	add_column :resources, :updated_by, :integer
  end
end
