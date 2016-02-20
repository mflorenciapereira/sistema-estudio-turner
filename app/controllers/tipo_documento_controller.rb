class TipoDocumentoController < ApplicationController

	def create
		@tipo_documento = TipoDocumento.new(tipo_documento_params)		
		@tipo_documento.save
	end

private


	def tipo_documento_params		
		params.require(:tipo_documento).permit!
	end	
end
