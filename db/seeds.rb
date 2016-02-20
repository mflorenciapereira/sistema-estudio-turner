# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TipoDocumento.delete_all
tipoDocumento = TipoDocumento.create({codigo:"DNI", descripcion: "DNI"})
Alumno.update_all(tipo_documento_id: tipoDocumento)
