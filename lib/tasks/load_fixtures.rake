desc 'Load the fixtures into the database'
task :load_fixtures, [] => :environment do |t, args|
	require 'csv'

	# Load all the models
	Dir[Rails.root.join("app", "models", "**", "*.rb")].each(&method(:require))
	# models = ActiveRecord::Base.subclasses.index_by(&:table_name)
	models = ::ApplicationRecord.subclasses.index_by(&:table_name)
	puts models
	Dir[Rails.root.join('db', 'fixtures', '*.csv')].each do |file|
		puts file
		table_name = file.split('/').last.split('.').first
		puts table_name
		model = models[table_name]
		puts model

		# Clear out existing records
		model.delete_all

		# Load all the records from the csv file
		header = nil
		CSV.foreach(file) do |row|
			if header.nil?
				header = row
				puts "Seeding #{file}..."
				next
			end

			atts = {}
			header.each_with_index{|h,i| atts[h.to_sym] = row[i]}
			_m = model.create(atts)
			puts _m.inspect
		end
	end

end