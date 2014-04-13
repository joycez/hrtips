# == Schema Information
#
# Table name: glossaries
#
#  id         :integer          not null, primary key
#  term       :string(255)
#  definition :text
#  language   :integer
#  created_at :datetime
#  updated_at :datetime
#  admin_id   :integer
#  updated_by :integer
#

class Glossary < ActiveRecord::Base
	include Functions
	belongs_to :admin
	default_scope order('term ASC')
	scope :english, where(language: 1)
	scope :spanish, where(language: 2)
	validates :term, :definition, :language, presence: true
	validates :language, inclusion: {in: [1,2]}
	validates :term, uniqueness: true
end
