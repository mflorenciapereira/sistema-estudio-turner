class AddTipoDocumentoToAlumnos < ActiveRecord::Migration
  def change
    add_reference :alumnos, :tipo_documento, index: true, foreign_key: true
	add_foreign_key :alumnos, :tipos_documentos, column: :tipo_documento_id
  end
end
