require "spec_helper"
feature "Los usuarios pueden crear alumnos" do
	scenario "con atributos válidos" do
		visit "/"
		click_link "Crear alumno"
		fill_in "Nombre", with: "María Florencia"
		fill_in "Apellido", with: "Pereira"
		fill_in "DNI", with: "33206679"		
		click_button "Crear Alumno"
		expect(page).to have_content "Alumno creado exitosamente."
	end
end