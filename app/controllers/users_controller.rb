class UsersController < ApplicationController   
  def index  
  	@users = User.all 
  end  
  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to @user, notice: 'User was successfully created.' }
  #       format.json { render :show, status: :created, location: @user}
  #     else
  #       format.html { render :new }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  #end
  def show
  	@user = User.find(params[:id])
    @posts = User.find_by(id: params[:id]).posts
 end
  
  def edit
  	@user = User.find(params[:id])
  end
  def new
  	@user = User.new
  end
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end
  def update  
  	@user = User.find(params[:id])
   respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end 
  def destroy  
	puts "PARAMS ARE" + params.inspect 
	@user = User.find(params[:id])   

	if @user.destroy     
		flash[:notice] = "User deleted successfully."   
	else     
		flash[:alert] = "There was a problem deleting    
		the user."   
	end 

	redirect_to :back 
  end
  private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_user
	      @user = User.find(params[:id])
	    end

	    
	    def user_params
	      params.require(:user).permit(:fname, :lname, :email, :password)
	    end
	
	


end