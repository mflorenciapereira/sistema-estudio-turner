require "spec_helper"

feature "Los usuarios pueden eliminar alumnos" do

	scenario "caso exitoso" do
		alumno = FactoryGirl.create(:alumno,nombre:"Soledad",apellido:"Lopez")
		
		visit "/"
		click_link "Soledad Lopez"
		click_link "Eliminar alumno"
		expect(page).to have_content "Alumno eliminado exitosamente"
		expect(page.current_url).to eq alumnos_url
		expect(page).to have_no_content "Soledad Lopez"
		
	end
end