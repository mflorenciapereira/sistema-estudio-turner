class CreateTipoDocumentos < ActiveRecord::Migration
  def change
    create_table :tipos_documento do |t|
      t.string :codigo
      t.string :descripcion

      t.timestamps null: true
    end
  end
end
