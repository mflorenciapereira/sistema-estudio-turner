require "spec_helper"
feature "Los usuarios pueden editar alumnos" do
	let(:tipo_documento) { FactoryGirl.create(:tipo_documento) }

	before do
		FactoryGirl.create(:alumno,nombre:"Soledad",apellido:"Lopez",tipo_documento:tipo_documento)
		visit "/"
		page.find('.table tr:nth-last-child(1) td:nth-last-child(1) a').click
		click_link "Editar alumno"	
	end

	scenario "con atributos válidos" do
		
		fill_in "Nombre", with: "Gisela"
		click_button "Actualizar alumno"
		
		expect(page).to have_content "Alumno actualizado exitosamente"
		expect(page).to have_content "Lopez, Gisela"	
	end
	
	scenario "con atributos inválidos" do
	
		fill_in "Nombre", with: ""
		click_button "Actualizar alumno"
		expect(page).to have_content "Falló la actualización del alumno."
		expect(page).to have_content "Nombre es requerido"
	end
end