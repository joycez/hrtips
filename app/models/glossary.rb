# == Schema Information
#
# Table name: glossaries
#
#  id           :integer          not null, primary key
#  project      :string(255)
#  term         :string(255)
#  source       :string(255)
#  source_label :string(255)
#  source_year  :string(255)
#  stats_id     :integer
#  definition   :text
#  language     :integer
#  created_at   :datetime
#  updated_at   :datetime
#  admin_id     :integer
#

class Glossary < ActiveRecord::Base
	belongs_to :admins
	scope :english, where(language: 1)
	scope :spanish, where(language: 2)
end
