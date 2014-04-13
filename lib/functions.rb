module Functions
	def saved_by(admin)
		self.updated_by = admin.id
		self.save
	end
end