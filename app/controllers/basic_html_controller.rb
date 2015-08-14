class BasicHtmlController < ApplicationController

	def index
		@states = State.all
	end

	def table

	end

end
