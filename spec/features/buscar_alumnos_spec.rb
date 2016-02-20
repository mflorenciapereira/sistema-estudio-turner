require "spec_helper"

feature "Los usuarios pueden buscar los alumnos" do
	let(:tipo_documento) { FactoryGirl.create(:tipo_documento) }

	before do
		FactoryGirl.create(:alumno,nombre:"Soledad",apellido:"Lopez", documento:"33206678", created_at: '2016-03-10 10:00:00', tipo_documento: tipo_documento)
		FactoryGirl.create(:alumno,nombre:"María",apellido:"Pereira", documento:"33206679", created_at: '2016-01-10 10:00:00', tipo_documento: tipo_documento)
		visit "/"
	end

	scenario "por documento" do
		fill_in "query", with: "33206678"
		click_button "Buscar"
		expect(page).to have_content "Soledad"
		expect(page).to have_content "Lopez"		
		expect(page).to have_content "33206678"		
		expect(page).not_to have_content "María"
		expect(page).not_to have_content "Florencia"		
		expect(page).not_to have_content "33206679"		
	
	end
	
	scenario "por aproximación de nombre" do
		fill_in "query", with: "Mari"
		click_button "Buscar"
		expect(page).to have_content "María"
		expect(page).to have_content "Pereira"		
		expect(page).to have_content "33206679"		
		expect(page).not_to have_content "Soledad"
		expect(page).not_to have_content "Lopez"		
		expect(page).not_to have_content "332066798"		
	
	end
	
	scenario "por aproximación de apellido" do
		fill_in "query", with: "Lope"
		click_button "Buscar"
		expect(page).to have_content "Soledad"
		expect(page).to have_content "Lopez"		
		expect(page).to have_content "33206678"		
		expect(page).not_to have_content "María"
		expect(page).not_to have_content "Florencia"		
		expect(page).not_to have_content "33206679"		
	
	end
	
	scenario "por fecha de creación" do
		fill_in "from", with: "01/01/2016"
		fill_in "to", with: "31/01/2016"
		click_button "Buscar"
		expect(page).to have_content "María"
		expect(page).to have_content "Pereira"		
		expect(page).to have_content "33206679"		
		expect(page).not_to have_content "Soledad"
		expect(page).not_to have_content "Lopez"		
		expect(page).not_to have_content "332066798"			
	
	end
	
	scenario "por fecha de creación desde" do
		fill_in "to", with: "01/01/2016"		
		click_button "Buscar"
		expect(page).to have_content "No se encontraron alumnos."		
	
	end
	
	scenario "por fecha de creación hasta" do
		fill_in "from", with: "01/03/2016"		
		click_button "Buscar"
		expect(page).to have_content "Soledad"
		expect(page).to have_content "Lopez"		
		expect(page).to have_content "33206678"		
		expect(page).not_to have_content "María"
		expect(page).not_to have_content "Pereira"		
		expect(page).not_to have_content "33206679"			
	
	end
	
	
end