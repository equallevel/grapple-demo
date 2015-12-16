require 'grapple'

# Basic Static Tables
class MyStaticTableBuilder < Grapple::DataGridBuilder
	
	# Cycle row colors
	configure :body, tr: Proc.new { |template| { :class => template.cycle('even', 'odd') } }
	configure :header, components: [:column_headings] 
	configure :footer, components: []
end

# Dynamic tables (AJAX)
class MyAjaxTableBuilder < Grapple::AjaxDataGridBuilder

	# Cycle row colors
	configure :body, tr: Proc.new { |template| { :class => template.cycle('even', 'odd') } }
	
	# To enable history by default
	#def self.container_attributes(template, options)
	#	options[:history] = true if options[:history].nil?
	#	super(template, options)
	#end
	
end

Grapple::Helpers::TableHelper.builder = MyAjaxTableBuilder
