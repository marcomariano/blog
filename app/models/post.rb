class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :tags_attributes
  
  #============================================================================
  #Validations
  validates_presence_of :name, :title
  validates_length_of :name, minimum: 3
    
  #============================================================================
  #relations
  
  has_many :comments, dependent: :destroy
  has_many :tags
  
  #============================================================================
  
   accepts_nested_attributes_for :tags, allow_destroy: :true,
    reject_if: proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
end
