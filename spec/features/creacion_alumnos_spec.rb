require "spec_helper"
feature "Los usuarios pueden crear alumnos" do

	before do
		visit "/"
		click_link "Crear alumno"
	end

	scenario "con atributos válidos" do
		fill_in "Nombre", with: "María Florencia"
		fill_in "Apellido", with: "Pereira"
		fill_in "Tipo de documento", with: "DNI"
		fill_in "Documento", with: "33206679"		
		fill_in "Email", with: "mflorenciapereira@gmail.com"		
		fill_in "Domicilio", with: "Av. San Martín 1281"		
		fill_in "Teléfono", with: "3433 3343"		
		fill_in "Teléfono de contacto", with: "3232 5454"		
		fill_in "Celular", with: "1543343343"		
		fill_in "Observaciones", with: "Prueba inicial."		
		click_button "Crear alumno"
		expect(page).to have_content "Alumno creado exitosamente."
		
		alumno = Alumno.find_by(apellido: "Pereira")		
		expect(page.current_url).to eq alumno_url(alumno)
		title = "Sistema Estudio Turner"
		expect(page).to have_title title
	end
	
	scenario "con atributos inválidos" do
		click_button "Crear alumno"
		expect(page).to have_content "Falló la creación del alumno."
		expect(page).to have_content "Nombre es requerido"
		expect(page).to have_content "Apellido es requerido"
		expect(page).to have_content "Tipo de documento es requerido"
		expect(page).to have_content "Documento es requerido"
		expect(page).to have_content "Email es requerido"
		
	end
end