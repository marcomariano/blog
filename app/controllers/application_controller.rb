class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
   #===========================================================================
  #private methods
  #===========================================================================
  private
  
  def find_post
    @post = Post.find(params[:id])
  end
  
  
  
  
  
end
