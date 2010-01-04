require 'spec_helper'

describe Album do

  it 'requires a name' do
    lambda do
      Factory(:album, :name => nil)
    end.should raise_error(ActiveRecord::RecordInvalid)
  end

end
