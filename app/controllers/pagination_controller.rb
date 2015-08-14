class PaginationController < ApplicationController

	def index
		@zip_codes = ZipCode.paginate(page: params[:page] || 1, per_page: 10)
	end

end
