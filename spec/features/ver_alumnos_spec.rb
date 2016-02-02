require "spec_helper"

feature "Los usuarios pueden ver los alumnos" do

	scenario "con detalles" do
		alumno = FactoryGirl.create(:alumno,nombre:"Soledad",apellido:"Lopez")
		
		visit "/"
		click_link "Soledad Lopez"
		expect(page.current_url).to eq alumno_url(alumno)
	
	end
end