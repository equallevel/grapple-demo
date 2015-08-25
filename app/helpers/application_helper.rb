module ApplicationHelper
	def code_view(filepath)
		if File.exists?(filepath)
			code = File.read(filepath)
		else
			code = ""
		end

		return code
	end

end
