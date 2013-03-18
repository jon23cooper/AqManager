class ParametersController < ApplicationController

  def index
    @parameters=Parameter.all
  end

  def new
  	@parameter=Parameter.new
  end
	
  def create
    @parameter=Parameter.new(parameter_params)
    @parameter.save
    if @parameter.save
      flash[:notice]="Parameter has been created."
      redirect_to @parameter
    else
      flash[:alert]="Parameter has not been created."
      render :action => "new"
    end
  end 
  
  def show
    @parameter=Parameter.find(params[:id])
  end
	
  private 
    def parameter_params
      params.require(:parameter).permit(:name, :units, :ocean_max, :ocean_norm, :ocean_min, :tank_max, :tank_optimum, :tank_min)
    end

end
