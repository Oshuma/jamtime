require 'spec_helper'

describe Song do
  before(:all) do
    remove_test_songs
    @song_path = File.join(::Rails.root, 'spec', 'music', 'song1.mp3')
  end

  before(:each) do
    @song = Factory(:song)
  end

  it 'requires a file path' do
    lambda do
      Factory(:song, :path => nil)
    end.should raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should find the song by path' do
    @song = Song.find_by_path(@song_path)
    @song.should_not be_nil
    @song.path.should == @song_path
  end

  it "should return nil if the music file isn't found" do
    @song = Song.find_by_path('/not/a/real/path')
    @song.should be_nil
  end

  it 'should raise a not found exception' do
    lambda do
      Song.find_by_path!('/not/a/real/path')
    end.should raise_error(ActiveRecord::RecordNotFound)
  end

  it 'should not recreate the database record' do
  end

  describe 'tags' do
    it 'has a tag name constant' do
      Song::TAGS.should_not be_nil
    end

    it 'has a title' do
      @song = Song.find_by_path(@song_path)
      @song.title.should_not be_nil
    end
  end

end
