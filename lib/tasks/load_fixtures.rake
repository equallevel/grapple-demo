desc 'Load the fixtures into the database'
task :load_fixtures, [] => :environment do |t, args|
	require 'csv'
	EPSILON = 0.00000001
	
	# Load all the models
	Dir[Rails.root.join("app", "models", "**", "*.rb")].each(&method(:require))
	models = ::ApplicationRecord.subclasses.index_by(&:table_name)
	
	Dir[Rails.root.join('db', 'fixtures', '*.csv')].each do |file|
		table_name = file.split('/').last.split('.').first
		model = models[table_name]
		puts "Loading #{model}..."
		
		if model.all.length > 5
			puts "#{model} already loaded"
			next
		end

		# Clear out existing records
		model.delete_all
		line_count = `wc -l "#{file}"`.strip.split(' ')[0].to_f

		# Load all the records from the csv file
		header = nil
		i = 0.0
		puts "Seeding #{table_name}..."
		CSV.foreach(file) do |row|
			if header.nil?
				header = row
				next
			end
			
			if ( (i / line_count * 100.0 + 1.0) % 100 ) - 1.0 < Float::EPSILON
				puts "#{(i / line_count * 100.0).round}% done..."
			end
			
			atts = {}
			header.each_with_index{|h,i| atts[h.to_sym] = row[i]}
			
			begin
				model.create(atts)
			rescue Exception => err
				puts "#{err.name} thrown while creating a model!"
				puts "\n Model data:\n#{atts}"
				puts "\n Exception:\n#{err.msg}"
			end
			
			i += 1.0
		end
		puts "#{table_name} successfully seeded."
	end

end
