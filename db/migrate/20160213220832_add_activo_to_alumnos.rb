class AddActivoToAlumnos < ActiveRecord::Migration
  def change
    add_column :alumnos, :activo, :boolean, default: true
  end
end
