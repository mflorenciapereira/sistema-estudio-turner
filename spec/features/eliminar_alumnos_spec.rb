require "spec_helper"

feature "Los usuarios pueden eliminar alumnos" do
	let(:tipo_documento) { FactoryGirl.create(:tipo_documento) }

	scenario "caso exitoso" do
		alumno = FactoryGirl.create(:alumno,nombre:"Soledad",apellido:"Lopez", tipo_documento: tipo_documento)		
		visit "/"
		page.find('.table tr:nth-last-child(1) td:nth-last-child(1) a').click
		click_link "Eliminar alumno"
		expect(page).to have_content "Alumno eliminado exitosamente"
		expect(page.current_url).to eq alumnos_url
		expect(page).to have_no_content "Soledad Lopez"
		
	end
end