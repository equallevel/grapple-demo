class BasicHtmlController < ApplicationController

	def index
		@articles = Article.all
	end

end
