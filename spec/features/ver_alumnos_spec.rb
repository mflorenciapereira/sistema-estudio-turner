require "spec_helper"

feature "Los usuarios pueden ver los alumnos" do
	let(:tipo_documento) { FactoryGirl.create(:tipo_documento) }

	scenario "con detalles" do
		alumno = FactoryGirl.create(:alumno,nombre:"Soledad",apellido:"Lopez", tipo_documento: tipo_documento)
		
		visit "/"
		page.find('.table tr:nth-last-child(1) td:nth-last-child(1) a').click
		expect(page.current_url).to eq alumno_url(alumno)
	
	end
end