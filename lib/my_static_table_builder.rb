# Basic Static Tables
class MyStaticTableBuilder < Grapple::DataGridBuilder
	
	# Cycle row colors
	configure :body, tr: Proc.new { |template| { :class => template.cycle('even', 'odd') } }
	configure :header, components: [:column_headings] 
	configure :footer, components: []
end
