class PostsController < ApplicationController   
  def index  
  	@posts = Post.all 
  end  

  def update   
  end 

end