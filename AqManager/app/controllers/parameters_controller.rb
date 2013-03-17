class ParametersController < ApplicationController

	def index
	
	end
	
	def new
		@parameter=Parameter.new
	end

end
