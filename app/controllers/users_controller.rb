class UsersController < ApplicationController   
  def index  
  	@users = User.all 
  end  

  def update   
  end 

end