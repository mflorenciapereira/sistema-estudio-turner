class AlumnosController < ApplicationController

	before_action :set_alumno, only: [:show, :edit, :update, :destroy]

	def index	
		@alumnos = Alumno.all
	end
	
	def new
		@alumno = Alumno.new
	end
	
	def create
		@alumno = Alumno.new(alumno_params)
		
		if @alumno.save
			flash[:notice] = t('success-create-alumno')
			redirect_to @alumno
		else
			flash.now[:alert] = t('error-create-alumno')
			render "new"
		end	
	end
	
	def show		
	end
	
	def edit
	end
	
	def update
		
		if @alumno.update(alumno_params)
			flash[:notice] = t('success-edit-alumno')
			redirect_to @alumno		
		else
			flash.now[:alert] = t('error-edit-alumno')
			render "edit"		
		end
		
	end
	
	def destroy
			
		@alumno.destroy
		flash[:notice] = t('success-delete-alumno')
		redirect_to alumnos_path
	
	end
	
	private
	
	def set_alumno
		@alumno = Alumno.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = t('alumno-not-found')
			redirect_to alumnos_path
	end
	
	def alumno_params
		params.require(:alumno).permit(:nombre,:apellido,:tipoDocumento,:documento,:email)
	end
end
