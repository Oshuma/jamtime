require 'spec_helper'

describe Song do
  before(:all) do
    remove_test_songs
  end

  before(:each) do
    @song = Factory(:song)
  end

  it 'requires a file path' do
    lambda do
      Factory(:song, :path => nil)
    end.should raise_error(ActiveRecord::RecordInvalid)
  end
end
