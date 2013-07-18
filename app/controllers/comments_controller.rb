class CommentsController < ApplicationController
  
  before_filter :find_post_comment
  before_filter :find_comment, only: [:update]
  
  
  def index
    
    @comments = @post.comments
    
  end #index
  

  def show
    
    @comment = @post.comments.find(params[:id])
    
  end#show 
  

  def new
    
     @comment = @post.comments.build
     
  end #show
  
  
  def create 
    
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
    
  end # create
  
  

  def edit
    
    @comment = @post.comments.find(params[:id])
    
  end
  
  def update
    #@comment = Comment.find(params[:id])
    
    if @comment.update_attributes(params[:comment])
      redirect_to post_comment_url(@post, @comment)
    else
      render action: "edit"
    end
    
  end #update
  
  def destroy
      
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
    
  end #destroy
  
  #private methods
  #================================================================
  private
  
  
  
  
  def find_post_comment
    
    @post = Post.find(params[:post_id])
    
  end#find_post_comment
  
  def find_comment
      
      @comment = @post.comments.find(params[:id])
        
  end #find_comment
  
  
  
  
  
end # end of class
