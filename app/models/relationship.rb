class Relationship < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :name
  has_many :subitems
end

