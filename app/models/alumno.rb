class Alumno < ActiveRecord::Base
	searchkick text_middle: [ :nombre, :apellido, :email, :documento ]
	validates :nombre,:apellido,:tipoDocumento,:documento,:email, presence:true	
	
	after_commit :reindex_dependencies
	
	def reindex_dependencies		
		Alumno.reindex
	end
end
