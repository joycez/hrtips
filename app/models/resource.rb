# == Schema Information
#
# Table name: resources
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  p_voice      :string(255)
#  p_fax        :string(255)
#  p_tty        :string(255)
#  p_other      :string(255)
#  p_other_desc :string(255)
#  street_1     :string(255)
#  street_2     :string(255)
#  city         :string(255)
#  state        :string(255)
#  zip          :string(255)
#  url          :string(255)
#  desc         :text
#  language     :integer
#  created_at   :datetime
#  updated_at   :datetime
#  admin_id     :integer
#

class Resource < ActiveRecord::Base
	has_and_belongs_to_many :brochures
	belongs_to :admins
	scope :english, where(language: 1)
	scope :spanish, where(language: 2)
end