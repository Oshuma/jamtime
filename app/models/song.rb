class Song < ActiveRecord::Base
  validates_presence_of :name, :path
  belongs_to :artist
  belongs_to :album
end
