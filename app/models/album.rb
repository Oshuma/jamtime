class Album < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :artist
  has_many :songs
end
