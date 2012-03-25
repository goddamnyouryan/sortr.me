class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :entries, :through => :taggings
end
