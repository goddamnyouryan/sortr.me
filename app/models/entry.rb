class Entry < ActiveRecord::Base
  has_many :taggings
  has_many :tags, :through => :taggings
  
  validates :name, :email, :presence => true
end
