class AjaxController < ApplicationController

	RESULTS_PER_PAGE = 15

	def index
		@zip_codes = search_results
	end

	def table
		@zip_codes = search_results
		render partial: 'table'
	end

protected

	def search_results
		# Default sorting options
		params[:sort] ||= 'zip'
		params[:dir] ||= 'asc'

		model = ZipCode.joins(:state)
		if params[:query].present?
			# Not a good way to search large data sets, this is just a demo
			model = model.where(
				"zip LIKE ? OR city LIKE ? OR county LIKE ?", 
				"%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%"
			)
		end
		sort_dir = params[:dir] == 'asc' ? :asc : :desc
		model = model.order(params[:sort] => sort_dir)
		model.paginate(page: params[:page] || 1, per_page: RESULTS_PER_PAGE)
	end
	
end
