require "spec_helper"

describe AlumnosController, type: :controller do

	it "maneja alumnos que no existen correctamente" do
		get :show,id: "inexistente"
		expect(response).to redirect_to(alumnos_path)
		expect(flash[:alert]).to eq "Alumno no encontrado"
	
	end
end 

