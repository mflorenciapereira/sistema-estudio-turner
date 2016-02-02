class CreateAlumnos < ActiveRecord::Migration
  def change
    create_table :alumnos do |t|
      t.string :apellido
      t.string :nombre
      t.string :tipoDocumento
      t.string :documento
      t.string :domicilio
      t.string :telefono
      t.string :celular
      t.string :email
      t.string :telefonoContacto
      t.string :observaciones

      t.timestamps null: false
    end
  end
end
