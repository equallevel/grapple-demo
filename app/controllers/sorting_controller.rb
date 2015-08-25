class SortingController < ApplicationController

	def index
		sort = (params[:sort] || "name") + " " + (params[:dir] || "asc")
		@states = State.paginate(page: 1, per_page: State.count).order(sort)
						
	end

end
