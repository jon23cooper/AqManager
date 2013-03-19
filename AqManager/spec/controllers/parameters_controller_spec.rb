require 'spec_helper'

describe ParametersController do
  it 'displays an error for a missing parameter' do
    get :show, :id => 'not-here'
    response.should redirect_to(parameters_path)
    message = 'The parameter you were looking for could not be found.'
    flash[:alert].should == message
  end
end
