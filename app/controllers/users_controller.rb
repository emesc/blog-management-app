class UsersController < ApplicationController

  # FOR LAYOUTS
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thank you for registering."
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    # render layout: false
  end

  private

    def user_params
      params.require(:user).permit(:full_name, :password)
    end


  # FOR NEVER STORING A MODEL IN THE SESSION
  # def index
  #   # let's start with actions that store model in the session
  #   # session[:user] = User.first
  #   # use the id of the user instead
  #   session[:user_id] = User.first.id
  #   redirect_to user_path(session[:user_id])
  # end

  # def show
  #   @user = User.find(session[:user_id])
  # end

  # def update
  #   @user = User.find(session[:user_id])
  #   @user.first_name = "Foo"
  #   logger.info @user.valid?.to_s

  #   redirect_to @user
  # end

end
