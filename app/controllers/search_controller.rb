class SearchController < ApplicationController

	def index
		@states = State.paginate(page: params[:page] || 1, per_page: 10)
	end

	def search

	end

end
