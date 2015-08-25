class SearchController < ApplicationController

	def index
		query = "#{(params[:query] || "").downcase}%"
		conds = ["LOWER(name) LIKE ? OR LOWER(code) LIKE ?", query, query]

		@states = State.paginate(page: params[:page] || 1, per_page: 10).where(conds)
	end

end
