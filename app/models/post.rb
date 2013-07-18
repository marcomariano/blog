class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title
  
  #============================================================================
  #Validations
  validates_presence_of :name, :title
  validates_length_of :name, minimum: 3
    
  #============================================================================
  #relations
  
  has_many :comments
  
end
