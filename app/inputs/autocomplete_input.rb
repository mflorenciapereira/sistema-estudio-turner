# app/inputs/currency_input.rb
class AutocompleteInput < SimpleForm::Inputs::CollectionInput

	
	
   def input(wrapper_options)	
	@label_name = options[:label_name]
	
	object_name = object.model_name.singular
    object_mapping_attributes = "#{object_name}[#{attribute_name.to_s}_attributes]"
    object_mapping = "#{object_name}[#{attribute_name.to_s}_id]"
    id_hidden1 = "#{object_name}_#{attribute_name.to_s}_attributes_id"
    id_hidden2 = "#{object_name}_#{attribute_name.to_s}_id"
	value = object.send("#{attribute_name.to_s}_id")
	initial_label = object.send("#{attribute_name.to_s}").try("#{@label_name}")
			
	source = Rails.application.routes.url_helpers.autocomplete_autocomplete_object_index_path
	asoc = object.class.reflect_on_all_associations.select {|a| a.name == attribute_name}
	
	class_name = ""
	if asoc[0].options && asoc[0].options[:class_name]
		class_name=asoc[0].options[:class_name]
	else
		class_name = asoc[0].name.to_s.classify
	end		
		
    template.hidden_field_tag("#{object_mapping_attributes}[id]",value) + 
	template.hidden_field_tag("#{object_mapping}",value) +
    template.text_field_tag("#{object_mapping_attributes}[#{@label_name}]", initial_label, :"data-source" => source, :"object-type" => class_name, :"data-field1" => "##{id_hidden1}",:"data-field2" => "##{id_hidden2}", :"data-min-chars" => options[:min_chars] || 3, :class => 'string optional form-control autocomplete')
		
	
	
    
  end
  
  def has_errors?			
	key = object.errors.messages.keys.find{|k| k.to_s.include? "#{attribute_name}"}
	!key.nil? && !object.errors.messages[key].empty?
  end
  
  def full_error_text	
  p t("activerecord.attributes.#{object_name}.#{attribute_name}")
	t("activerecord.attributes.#{object_name}.#{attribute_name}") + " "+ object.errors.messages[object.errors.messages.keys.find{|k| k.to_s.include? "#{attribute_name}"}][0]
  end
  
  
end