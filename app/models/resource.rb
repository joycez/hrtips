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
  include Functions
	has_and_belongs_to_many :brochures
	belongs_to :admin
	default_scope order('name ASC')
	scope :english, where(language: 1)
	scope :spanish, where(language: 2)
  validates :name, :desc, :language, presence: true

  def address
    address = ""
    unless street_1.blank?
      address += street_1
    end
    unless street_2.blank?
      address += (", " + street_2)
    end
    unless city.blank?
      address += ("</br>" + city)
    end
    unless state.blank?
      address += (", " + state)
    end
    unless zip.blank?
      address += (" " + zip)
    end
  end

  def contacts?
  	if (p_voice.nil? || p_voice.blank?) && (p_tty.nil? || p_tty.blank?) && (p_fax.nil? || p_fax.blank?) && (p_other.nil? || p_other.blank?) && (url.nil? || url.blank?)
  		false
  	else
  		true
  	end
  end

  def correct_url
    link = ''
    unless url.blank? || url.nil?
      if url.start_with? 'http'
        link = url
      else
        link = 'http://'+url
      end
    end
  end

end