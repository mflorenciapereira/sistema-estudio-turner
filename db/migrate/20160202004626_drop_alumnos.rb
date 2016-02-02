class DropAlumnos < ActiveRecord::Migration
  def up
	 drop_table :alumnos
  end
  
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
