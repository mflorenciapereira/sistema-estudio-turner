class ChangeDniToDni < ActiveRecord::Migration
  def change
	rename_column :alumnos, :dni, :DNI
  end
end
