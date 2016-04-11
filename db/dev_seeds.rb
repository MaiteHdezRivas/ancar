require 'database_cleaner'

DatabaseCleaner.clean_with :truncation

puts "Creando settings"
  Setting.create!(key: "header_logo", value: "Análisis de la carga de trabajo")
  Setting.create!(key: "org_name", value: "Ayuntamiento de Madrid")
  Setting.create!(key: "app_name", value: "Análisis de la carga de trabajo")

puts "Creando procesos"
	descripcion_2 = Faker::Lorem.words(25)
	(1..30).each do |i|
	  process = Mainprocess.create!(orden: i,
	            descripcion: Faker::Lorem.sentence(1).truncate(60),
	            created_at: rand((Time.now - 1.week) .. Time.now))
	  puts "    #{process.descripcion}" 

puts "Creando subrocesos"
	
puts "Creando tareas"
	
end
