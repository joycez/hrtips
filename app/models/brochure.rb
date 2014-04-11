# == Schema Information
#
# Table name: brochures
#
#  id          :integer          not null, primary key
#  topic       :string(255)
#  name        :string(255)
#  group_id    :integer
#  link        :string(255)
#  content     :text
#  pdf_link    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  author_hist :text
#  admin_id    :integer
#

class Brochure < ActiveRecord::Base
	acts_as_taggable
	belongs_to :admins
	has_and_belongs_to_many :resources
	scope :english, where(language: 1)
	scope :spanish, where(language: 2)
end