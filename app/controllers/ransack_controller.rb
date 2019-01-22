class RansackController < ApplicationController
	def index
		@q = ZipCode.ransack(params[:q])
		@zip_codes = @q.result.includes(:state).page(params[:page])
		puts "\n\nINFO: @zip_codes RESULTS:"
		puts @zip_codes.class
	end
end
