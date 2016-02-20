class DropColumnTipoDocumento < ActiveRecord::Migration
  def change
	remove_column :alumnos, :tipoDocumento
  end
end
