# coding: utf-8

# == Schema Information
#
# Table name: brochures
#
#  id             :integer          not null, primary key
#  topic          :string(255)
#  name           :string(255)
#  group_id       :integer
#  content        :text(2147483647)
#  pdf_link       :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  author_hist    :text
#  admin_id       :integer
#  language       :integer
#  authored_by    :text
#  updated_by     :text
#  prod_id        :integer
#  a_desc         :text
#  u_desc         :text
#  raw_created_at :string(100)
#  raw_updated_at :string(100)
#

class Brochure < ActiveRecord::Base
	include Functions
	acts_as_taggable
	belongs_to :admin
	has_and_belongs_to_many :resources

	default_scope {order('topic ASC')}
	scope :english, -> { where(language: 1) }
	scope :spanish, -> { where(language: 2) }

	validates :topic, :name, :group_id, :content, :language, presence: true
	validates :group_id, inclusion: {in: [0,1,2,3,4,5]}
	validates :language, inclusion: {in: [1,2]}
	validates :name, uniqueness: true

	def self.english_topics
		Brochure.english.map(&:topic).uniq
	end

	def self.english_groups
		["Disability Nondiscrimination Regulations", "Management and HR Practice",
			"Employment Process", "Accomodations of Specific Disabilities", "HR Checklists"]
	end

	def self.spanish_groups
		["Reglamentaciones de no-discriminación de la discapacidad", "Administración y prácticas de RH",
			"Proceso de empleo", "Acomodaciones para discapacidades específicas", "Listas de RH"]
	end

	def self.groups
		[["Disability Nondiscrimination Regulations", "Reglamentaciones de no-discriminación de la discapacidad"],
		["Management and HR Practice", "Administración y prácticas de RH"],
		["Employment Process", "Proceso de empleo"],
		["Accomodations of Specific Disabilities", "Acomodaciones para discapacidades específicas"],
		["HR Checklists", "Listas de RH"]]
	end

	def self.english_tags
		ActsAsTaggableOn::Tag.all
	end


end
