require "spec_helper"

feature "Los usuarios pueden ver los alumnos" do

	scenario "con detalles" do
		alumno = FactoryGirl.create(:alumno,nombre:"Soledad",apellido:"Lopez")
		
		visit "/"
		page.find('.table tr:nth-last-child(1) td:nth-last-child(1) a').click
		expect(page.current_url).to eq alumno_url(alumno)
	
	end
end