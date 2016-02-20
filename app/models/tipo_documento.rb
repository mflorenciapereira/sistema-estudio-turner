class TipoDocumento < ActiveRecord::Base

	self.table_name = "tipos_documento"	
	
	validates :descripcion, presence:true	
	
	def to_s
		return descripcion
	end
	
	class << self # Class methods
        def autocomplete_query query
			return TipoDocumento.where('descripcion LIKE ?', "%"+query+"%").limit(20).order('descripcion')
		end
    end
	
	private 
	
	def tipo_documento_params
      params.permit!
    end
end
