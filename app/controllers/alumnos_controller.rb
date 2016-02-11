class AlumnosController < ApplicationController

	before_action :set_alumno, only: [:show, :edit, :update, :destroy]

	def index	
		conditions = {}
		
		date_filter = params[:from].present? || params[:to].present?
		data_filter = params[:query].present?
		order_present = params[:fieldOrder].present? && params[:orderDirection].present?
		
		if date_filter
			conditions[:created_at]={}
			
			if params[:from].present?			
				 conditions[:created_at][:gte] = DateTime.strptime(params[:from], '%d/%m/%Y')
			end		
			
			if params[:to].present?
				conditions[:created_at][:lte] = DateTime.strptime(params[:to], '%d/%m/%Y')
			end		
		end
					
		order = {}
		
		if(order_present)
			order[params[:fieldOrder]]=params[:orderDirection]			
			if(params[:fieldOrder]== 'apellido')
				order['nombre']=params[:orderDirection]
			end
		else
			order[:created_at]='desc'
		end
		
		if data_filter && date_filter
			@alumnos = Alumno.search params[:query], fields: [:apellido,:nombre,:email,:documento], match: :text_middle, where: conditions, page: params[:page], per_page: 5, order: order
		elsif data_filter
			@alumnos = Alumno.search params[:query], fields: [:apellido,:nombre,:email,:documento], match: :text_middle, page: params[:page], per_page: 5, order: order
		elsif date_filter
			@alumnos = Alumno.search "*", page: params[:page], per_page: 5, where: conditions, order: order
		else
			@alumnos = Alumno.search "*", page: params[:page], per_page: 5, order: order
		end
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
