# Dynamic tables w/History
class MyHistoryTableBuilder < Grapple::AjaxDataGridBuilder
	# To enable history by default
	def default_options
		super.merge({ history: true })
	end
end
