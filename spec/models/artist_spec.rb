require 'spec_helper'

describe Artist do

  it 'requires a name' do
    lambda do
      Factory(:artist, :name => nil)
    end.should raise_error(ActiveRecord::RecordInvalid)
  end

end
