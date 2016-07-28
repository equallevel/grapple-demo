class AjaxHistoryMultiController < ApplicationController

	RESULTS_PER_PAGE = 10

	def index
		@zip_codes = zip_code_search_results
		@states = state_search_results
	end

	def zip_codes_table
		@zip_codes = zip_code_search_results
		render partial: 'zip_codes_table'
	end
	
	def states_table
		@states = state_search_results
		render partial: 'states_table'
	end

protected

	def zip_code_search_results
		args = params[:zip_codes] || {}
		# Default sorting options
		args[:sort] ||= 'zip'
		args[:dir] ||= 'asc'

		model = ZipCode.joins(:state)
		if args[:query].present?
			# Not a good way to search large data sets, this is just a demo
			model = model.where(
				"zip LIKE ? OR city LIKE ? OR county LIKE ?", 
				"%#{args[:query]}%", "%#{args[:query]}%", "%#{args[:query]}%"
			)
		end
		sort_column = ZipCode.connection.quote_column_name(args[:sort])
		sort_dir = args[:dir] == 'asc' ? 'ASC' : 'DESC'
		model = model.order(sort_column + " " + sort_dir)
		model.paginate(page: args[:page] || 1, per_page: RESULTS_PER_PAGE)
	end

	def state_search_results
		args = params[:states] || {}
		# Default sorting options
		args[:sort] ||= 'name'
		args[:dir] ||= 'asc'

		model = State
		if args[:query].present?
			# Not a good way to search large data sets, this is just a demo
			model = model.where(
				"name LIKE ? OR code LIKE ?", 
				"%#{args[:query]}%", "%#{args[:query]}%"
			)
		end
		sort_column = State.connection.quote_column_name(args[:sort])
		sort_dir = args[:dir] == 'asc' ? 'ASC' : 'DESC'
		model = model.order(sort_column + " " + sort_dir)
		model.paginate(page: args[:page] || 1, per_page: RESULTS_PER_PAGE)
	end
	
end
