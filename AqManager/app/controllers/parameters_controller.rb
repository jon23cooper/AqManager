class ParametersController < ApplicationController

  before_filter :find_project, :only => [:show, :edit, :update, :destroy]

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
   # @parameter=Parameter.find(params[:id])
  end

  def edit
    #@parameter = Parameter.find(params[:id])
  end

  def update
    #@parameter=Parameter.find(params[:id])
    if @parameter.update_attributes(parameter_params)
      flash[:notice] = 'Parameter has been updated.'
      redirect_to @parameter
    else
      flash[:alert] = 'Parameter has not been updated.'
      render :action => 'edit'
    end
  end

  def destroy
    #@parameter=Parameter.find(params[:id])
    @parameter.destroy
    flash[:notice]="Parameter has been deleted."
    redirect_to parameters_path
  end
	
  private 
    def parameter_params
      params.require(:parameter).permit(:name, :units, :ocean_max, :ocean_norm, :ocean_min, :tank_max, :tank_optimum, :tank_min)
    end
  private
    def find_project
      @parameter=Parameter.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'The parameter you were looking for could not be found.'
      redirect_to parameters_path
    end

end
