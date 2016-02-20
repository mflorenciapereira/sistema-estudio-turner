class CreateProfesors < ActiveRecord::Migration
  def change
    create_table :profesors do |t|
      t.string :nombre
      t.string :apellido
      t.string :documento
      t.string :email
      t.string :celular
      t.decimal :comision
      t.decimal :sueldo

      t.timestamps null: false
    end
  end
end
