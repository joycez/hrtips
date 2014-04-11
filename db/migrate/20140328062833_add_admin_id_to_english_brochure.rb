class AddAdminIdToEnglishBrochure < ActiveRecord::Migration
  def change
    add_column :english_brochures, :admin_id, :integer
  end
end
