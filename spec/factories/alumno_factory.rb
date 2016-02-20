require 'time'

FactoryGirl.define do
	factory :alumno do
		nombre:"Soledad"
		apellido:"Lopez"		
		documento:"33204999"
		email:"solelomas@gmail.com"		
		created_at:"2012-01-02"	
		tipo_documento_id:"1"
		
		
		 after(:create) {|instance| 
			Alumno.reindex
		 }
	end

end