class PostsController < ApplicationController

	before_action :authenticate_user, {only: [:index, :edit, :update, :destroy]}
	before_action :is_login, {only: [:login, :login_form]}

	protect_from_forgery except: :create
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  	#@post = Post.find_by(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to '/', notice: 'Post was successfully created.' }
#        format.json { render :show, status: :created, location: @post }
      else
      	format.html { redirect_to '/kobe/index.html' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to action: 'index', notice: 'Post was successfully updated.' }
#        format.json { render :show, status: :ok, location: @post }
					#redirect_to '/posts/index'
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to '/posts/index', notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	def catalog
		@posts = Post.where(display: true)
	end
	
	def login_form
	end
	
	def login
		@user = User.find_by(name: params[:name])
		if @user
			if @user.authenticate(params[:password])
				session[:user_id] = @user.id
				flash[:notice] = "ログインしました"
				redirect_to("/posts/index")
			else
				@error_message = "ログイン間違い"
				redirect_to("/login")
			end
		end
	end

	
	def logout
		session[:user_id] = nil
		flash[:notice] = "ログアウトしました"
		redirect_to("/login")
	end
	
	
	
	


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :problem, :img, :latitude, :longitude, :display)
    end
end
