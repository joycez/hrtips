# coding: utf-8

class Translation < ActiveRecord::Base
	belongs_to :english_brochure, class_name: "Brochure"
	belongs_to :spanish_brochure, class_name: "Brochure"
	validates :english_brochure_id, :spanish_brochure_id, presence: true
end