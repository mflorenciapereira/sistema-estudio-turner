class AutocompleteObjectController < ApplicationController

	def autocomplete
		object = params[:type].camelize.constantize
		p object.autocomplete_query(params[:query])
		query_result = object.autocomplete_query(params[:query])
		
		converted_results = []
		
		query_result.each do |result|
			convertedObject = AutocompleteObject.new
			convertedObject.id = result.id
			convertedObject.description = result.to_s			
			converted_results.push(convertedObject)
		end
		
		respond_to do |format|
				format.json {					
					render :json => { :result => converted_results }
				}
		end		
		
	end	
	
end
