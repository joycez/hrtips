class AddAuthorshipHistoryToEnglishBrochure < ActiveRecord::Migration
  def change
    add_column :english_brochures, :author_hist, :text
  end
end
