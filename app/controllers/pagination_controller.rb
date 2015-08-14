class PaginationController < ApplicationController

	def index
		@articles = Article.paginate(page: params[:page] || 1, per_page: 10)
	end

	def table
		@articles = Article.paginate(page: params[:page] || 1, per_page: 10)
	end

end
