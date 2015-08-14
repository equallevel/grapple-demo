desc 'Load the fixtures into the database'
task :load_fixtures, [] => :environment do |t, args|

	# Load all the models
	Dir[Rails.root.join("app", "models", "**", "*.rb")].each(&method(:require))
	models = ActiveRecord::Base.subclasses.index_by(&:table_name)

	Dir[Rails.root.join('db', 'fixtures', '*.csv')].each do |file|
		puts file
		table_name = file.split('/').last.split('.').first
		puts table_name
		model = models[table_name]
		puts model
		header = nil
		CSV.foreach(file) do |row|
			if header.nil?
				header = row
				next
			end

			# TODO: Map the row using the header
			# TODO: Import the row using the model
			
		end
	end

end