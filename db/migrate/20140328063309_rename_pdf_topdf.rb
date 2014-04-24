# coding: utf-8

class RenamePdfTopdf < ActiveRecord::Migration
  def change
  	rename_column :english_brochures, :PDF_link, :pdf_link
  end
end
