class SearchController < ApplicationController

	def index
		params[:query] ||= ""
		query = "#{params[:query].downcase}%"
		@states = State.paginate(page: params[:page] || 1, per_page: 10)
							.where("LOWER(name) LIKE ? OR LOWER(code) LIKE ?", query, query)
	end

end
