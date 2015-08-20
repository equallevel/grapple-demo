class SearchController < ApplicationController

	def index
		params[:query] ||= ""
		query = "#{params[:query].downcase}%"
		@states = State.where("name LIKE ? OR code LIKE ?", query, query)
	end

end
