require 'spec_helper'

describe Song do

  it 'requires a title' do
    lambda do
      Factory(:song, :title => nil)
    end.should raise_error(ActiveRecord::RecordInvalid)
  end

  it 'requires a path' do
    lambda do
      Factory(:song, :path => nil)
    end.should raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has a list of valid file types' do
    Song::FILETYPES.should_not be_empty
  end

  it 'should end in a valid file type' do
    lambda do
      Factory(:song, :path => '/path/to/song.invalid')
    end.should raise_error(ActiveRecord::RecordInvalid)
  end

  it 'accepts a valid file type' do
    song = Factory(:song, :path => "/path/to/song.#{Song::FILETYPES.first}")
    song.should_not be_nil
  end

end
