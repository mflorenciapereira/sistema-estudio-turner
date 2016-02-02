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
		click_button "Crear Alumno"
		expect(page).to have_content "Alumno creado exitosamente."
		
		alumno = Alumno.find_by(apellido: "Pereira")		
		expect(page.current_url).to eq alumno_url(alumno)
		title = "Sistema Estudio Turner"
		expect(page).to have_title title
	end
	
	scenario "con atributos inválidos" do
		click_button "Crear Alumno"
		expect(page).to have_content "Falló la creación del alumno."
		expect(page).to have_content "Nombre es requerido"
		expect(page).to have_content "Apellido es requerido"
		expect(page).to have_content "Tipodocumento es requerido"
		expect(page).to have_content "Documento es requerido"
		expect(page).to have_content "Email es requerido"
		
	end
end