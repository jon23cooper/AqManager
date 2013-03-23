class TestresultsController < ApplicationController

  before_filter :find_parameter
  before_filter :find_testresult, :only => [:show, :edit, :update, :destroy]


  def new
    @testresult=@parameter.testresults.build
  end

  def create


    my_result_date=Time.new(params['testresult']['testresult_date(1i)'] , params['testresult']['testresult_date(2i)'], params['testresult']['testresult_date(3i)'], \
      params['testresult']['testresult_date(4i)'], params['testresult']['testresult_date(5i)']).to_i

    #print(my_result_date)

    @testresult=@parameter.testresults.build({'value'=>params['testresult']['value'],'testresult_date'=>my_result_date, 'note'=>params['testresult']['note']})
    if @testresult.save
      flash[:notice] = "Test result has been created."
      redirect_to [@parameter, @testresult]
    else
      flash[:alert]='Test result has not been created.'
      render :action => 'new'

    end
  end

  def show

  end

  def find_testresult
    @testresult=@parameter.testresults.find(params[:id])
  end

  private
    def testresult_params
      params.require(:testresult).permit(:value, :testresult_date, :note)
    end

  private
    def find_parameter
      @parameter = Parameter.find(params[:parameter_id])
    end


end