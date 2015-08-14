class SortingController < ApplicationController

	def index
		@states = State.paginate(page: 1, per_page: State.count).order((params[:sort] || "name") + " " + (params[:dir] || "asc"))
	end

end
