require 'time'

FactoryGirl.define do
	factory :alumno do
		nombre:"Soledad"
		apellido:"Lopez"
		tipoDocumento:"DNI"
		documento:"33204999"
		email:"solelomas@gmail.com"		
		created_at:"2012-01-02"		
		
		 after(:create) {|instance| 
			Alumno.reindex
		 }
	end

end