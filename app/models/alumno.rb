class Alumno < ActiveRecord::Base
	searchkick text_middle: [ :nombre, :apellido, :email, :documento ]
	validates :nombre,:apellido,:tipoDocumento,:documento,:email, presence:true	
	validates_format_of :email,:with => Devise::email_regexp
	
	def deactivate
		self.update(activo: false)
	end	
	
	def activate
		self.update(activo: true)
	end
	
	after_commit :reindex_dependencies
	
	def reindex_dependencies		
		Alumno.reindex
	end	
		
end
