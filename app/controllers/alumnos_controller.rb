class AlumnosController < ApplicationController
	def index	
		@alumnos = Alumno.all
	end
	
	def new
		@alumno = Alumno.new
	end
	
	def create
		@alumno = Alumno.new(alumno_params)
		
		if @alumno.save
			flash[:notice] = I18n.t 'success-create-alumno'
			redirect_to @alumno
		else
			flash.now[:alert] = I18n.t 'error-create-alumno'
			render "new"
		end	
	end
	
	def show
		@alumno = Alumno.find(params[:id])	
	end
	
	def edit
		@alumno = Alumno.find(params[:id])	
	end
	
	def update
		@alumno = Alumno.find(params[:id])
		
		if @alumno.update(alumno_params)
			flash[:notice] = I18n.t 'success-edit-alumno'
			redirect_to @alumno		
		else
			flash.now[:alert] = I18n.t 'error-edit-alumno'
			render "edit"		
		end
		
	end
	
	private
	
	def alumno_params
		params.require(:alumno).permit(:nombre,:apellido,:tipoDocumento,:documento,:email)
	end
end
