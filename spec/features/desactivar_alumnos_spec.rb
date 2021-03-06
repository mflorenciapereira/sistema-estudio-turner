require "spec_helper"

feature "Los usuarios pueden" do
	let(:tipo_documento) { FactoryGirl.create(:tipo_documento) }

	scenario "desactivar alumnos activos" do
		FactoryGirl.create(:alumno,nombre:"Soledad",apellido:"Lopez", activo: true, tipo_documento: tipo_documento)
		visit "/"
		page.find('.table tr:nth-last-child(1) td:nth-last-child(1) a').click
	
		click_link "Desactivar alumno"
		expect(page).to have_content "Se desactivó el alumno exitosamente."				
		page.find('div#datos.tab-pane.active dl.dl-horizontal > dd:nth-child(20)').text.should eq("No")
	end	
	
	scenario "activat alumnos desactivados" do
		FactoryGirl.create(:alumno,nombre:"Soledad",apellido:"Lopez", activo: false, tipo_documento: tipo_documento)
		visit "/"
		uncheck "activo"
		click_button "Buscar"
		page.find('.table tr:nth-last-child(1) td:nth-last-child(1) a').click
	
		click_link "Activar alumno"
		expect(page).to have_content "Se activó el alumno exitosamente."				
		page.find('div#datos.tab-pane.active dl.dl-horizontal > dd:nth-child(20)').text.should eq("Sí")
	end
	
end