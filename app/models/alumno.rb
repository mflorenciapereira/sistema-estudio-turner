class Alumno < ActiveRecord::Base

	validates :nombre,:apellido,:tipoDocumento,:documento,:email, presence:true
end
