class BasicHtmlController < ApplicationController

	def index
		@states = State.all
	end

end
