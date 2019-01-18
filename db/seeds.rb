require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Articles
Article.create({ title: "Why String Cheese is Amazing", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec viverra sagittis urna et condimentum. Sed turpis lorem, interdum eget ex ac, tincidunt finibus libero. Nunc aliquet vel tortor ut faucibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam vel consequat tortor, sed fermentum eros. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean a ullamcorper ante. Fusce vulputate, lectus mattis lobortis semper, eros neque finibus erat, ac dignissim lorem nisi venenatis sem. Ut lobortis lectus in bibendum vulputate. Vivamus ut ex nisl. Duis a mauris sit amet lacus dapibus fringilla. Cras eu eros quis augue eleifend porta. Nulla facilisi. Donec ac magna velit. Proin quis ultrices nulla." })
Article.create({ title: "1, 2, 3, 4... yes", text: "Praesent a eros quam. Donec at finibus lectus, eu blandit odio. Pellentesque elementum semper leo ac maximus. Nulla posuere tincidunt nisl lacinia feugiat. Ut pretium pharetra eros. Mauris bibendum feugiat nunc et interdum. Cras varius elit vel purus tempus, tempus blandit ante laoreet. Maecenas posuere at ante at vehicula. Duis porta ultrices tortor, id ultricies nisl eleifend ac." })
Article.create({ title: "Yuhhhh", text: "Nullam quam turpis, pulvinar eu dolor vitae, eleifend ultrices leo. Etiam nec tellus id sapien laoreet posuere vel vel quam. Quisque eget lacus eget massa bibendum condimentum. Fusce vitae suscipit urna. Curabitur sit amet lacinia arcu. Suspendisse luctus risus sed lectus ultrices tincidunt. Cras metus magna, tempus feugiat malesuada sit amet, mollis id velit. Sed mi nunc, tincidunt sit amet imperdiet porttitor, porta vitae purus." })
Article.create({ title: "Why PHP is dead", text: "Vivamus laoreet, eros in lobortis pellentesque, dolor elit lobortis purus, at placerat tellus felis sit amet odio. Integer pharetra dolor ut velit gravida rhoncus. Integer et venenatis nulla. Mauris at commodo metus. Sed eget magna nisl. Integer vel ultricies tellus, id accumsan augue. Vestibulum lacinia urna vel blandit ultrices. Curabitur id libero vel nisl posuere imperdiet eu nec ante. Cras turpis leo, dictum ac massa sit amet, porttitor lobortis lacus. Nullam euismod eget metus fringilla congue. Phasellus venenatis non dolor eu porta. Aliquam id iaculis nisi, in tristique nibh. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla tincidunt dolor tellus, eu pretium ligula tincidunt eget. Pellentesque viverra dui eu sapien rhoncus ornare. Cras rutrum lacinia bibendum." })
Article.create({ title: "What not to tell your nan at Christmas", text: "Praesent vehicula erat quis bibendum placerat. Pellentesque feugiat blandit diam vel sollicitudin. Sed quam massa, tristique in orci eu, blandit vehicula ligula. Nullam cursus tempor dapibus. Etiam nec risus eget eros fringilla faucibus sit amet ut augue. Sed at hendrerit neque. Nullam ut condimentum magna. Integer in pretium nibh, non facilisis justo. In bibendum pulvinar laoreet." })

# States
CSV.foreach(Rails.root.join("db", "fixtures", "states.csv")) do |row|
	state = State.new

	state.name = row[1]
	state.code = row[2]

	state.save
end    
# ZIP Codes
CSV.foreach(Rails.root.join("db", "fixtures", "zip_codes.csv")) do |row|
	zipcode = ZipCode.new
	
	zipcode.zip = row[0]
	zipcode.city = row[1]
	zipcode.state_id = row[2]
	zipcode.county = row[3]
	zipcode.latitude = row[4]
	zipcode.longitude = row[5]

	zipcode.save
end