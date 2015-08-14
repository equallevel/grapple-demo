desc 'Load the fixtures into the database'
task :load_fixtures, [] => :environment do |t, args|
	require 'csv'

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

			atts = {}
			header.each_with_index{|h,i| atts[h.to_sym] = row[i]}
			model.first_or_create(atts)
		end
	end

end