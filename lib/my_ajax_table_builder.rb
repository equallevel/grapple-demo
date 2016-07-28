# Dynamic tables (AJAX)
class MyAjaxTableBuilder < Grapple::AjaxDataGridBuilder

	# Cycle row colors
	configure :body, tr: Proc.new { |template| { :class => template.cycle('even', 'odd') } }
	
	# To enable history by default
	#self.container_attributes(template, options)
	#	options[:history] = true if options[:history].nil?
	#	super(template, options)
	#end
	
end