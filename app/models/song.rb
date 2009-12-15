class Song < ActiveRecord::Base
  validates_presence_of :path
end
