class PostsController < ApplicationController   
  def index  
  	@posts = Post.all 
  end  

  

  def show
  	@post = Post.find(params[:id])
  end

def edit
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post}
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

  end
  def update  
    @post = Post.find(params[:id])
   respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
    
  end 


  def destroy  
	puts "PARAMS ARE" + params.inspect 
	@post = Post.find(params[:id])   

	if @post.destroy     
		flash[:notice] = "Post deleted successfully."   
	else     
		flash[:alert] = "There was a problem deleting    
		the post."   
	end 

	redirect_to :back 
  end

private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @user = post.find(params[:id])
      end

      
      def post_params
        params.require(:post).permit(:user_id, :content)
      end
  
  





end