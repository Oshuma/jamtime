require 'spec_helper'

describe Song do

  it 'requires a name' do
    lambda do
      Factory(:song, :name => nil)
    end.should raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires a path' do
    lambda do
      Factory(:song, :path => nil)
    end.should raise_error(ActiveRecord::RecordInvalid)
  end

end
