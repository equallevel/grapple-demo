class RansackController < ApplicationController
	def index
		@q = ZipCode.ransack(params[:q])
		@zip_codes = @q.result(distinct: true)
	end
end
