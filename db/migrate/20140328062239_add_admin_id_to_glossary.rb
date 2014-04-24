# coding: utf-8

class AddAdminIdToGlossary < ActiveRecord::Migration
  def change
    add_column :glossaries, :admin_id, :integer
  end
end
