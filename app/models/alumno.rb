class Alumno < ActiveRecord::Base

	belongs_to :tipo_documento,class_name: "TipoDocumento"
	accepts_nested_attributes_for :tipo_documento

	searchkick text_middle: [ :nombre, :apellido, :email, :documento ]
	validates :nombre,:apellido,:tipo_documento,:documento,:email, presence:true	
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
			
	
=begin
	def tipo_documento_attributes=(tipo_documento_attributes)    
    self.tipo_documento = TipoDocumento.find_or_initialize_by_id(tipo_documento_attributes[:id])
    self.client.tipo_documento.attributes = tipo_documento_attributes
  end
=end
		
end
