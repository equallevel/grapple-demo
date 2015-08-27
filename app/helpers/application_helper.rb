module ApplicationHelper
	def code_tabs(paths)
		code_data = []
		paths.each do |path|
			next unless File.exists?(path)

			data = {}
			data[:filename] = File.basename(path)
			data[:name] = data[:filename].split(".").first
			data[:source] = File.read(path)
			data[:mode] = File.extname(path) == 'rb' ? 'ruby' : 'htmlmixed'
			data[:active] = (path == paths.first)

			code_data << data
		end

		html = ""
		html += "<ul class='nav nav-tabs'>"
		code_data.each do |cd|
			active = (cd[:active] ? "class='active'" : "")
			html += "<li role='presentation' #{active}><a href='##{cd[:name]}' aria-controls='#{cd[:name]}' role='tab' data-toggle='tab'>#{cd[:filename]}</a></li>"
		end
		html += "</ul>"

		html += "<div class='tab-content'>"
		code_data.each do |cd|
			active = (cd[:active] ? "active" : "")
			html += "<div role='tabpanel' class='tab-pane #{active}' id='#{cd[:name]}'>"
			html += "<textarea id='#{cd[:name]}_hidden' style='display:none'>#{cd[:source]}</textarea>"
		  html += "<div id='#{cd[:name]}_codemirror' class='editor'></div>"
		  html += "<script type='text/javascript'>$( document ).ready(function() {initalizeCodeMirror('#{cd[:name]}', '#{cd[:mode]}');})</script>"
		  html += "</div>"
		end
		html += "</div>"

		puts "\n\n\n!!!"
		puts html

		return html.html_safe
	end

end
