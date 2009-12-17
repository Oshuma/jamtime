require 'spec_helper'

describe BrowseController do

  it 'should list the music directory' do
    get :index
    response.should be_success
    assigns[:folders].should_not be_nil
    assigns[:songs].should_not be_nil
  end

end
