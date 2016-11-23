class UsersController < ApplicationController

  load_and_authorize_resource
  before_action :authenticate_user!
  # before_action :find_user, only: [:show, :edit, :update, :destroy]

  # FOR LAYOUTS
  def index
    @users = User.all
  end

  def new
    # @user = User.new
  end

  def create
    # @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thank you for registering."
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    # render layout: false
    @joined_on = @user.created_at.to_formatted_s(:short)
    if @user.current_sign_in_at
      @last_login = @user.current_sign_in_at.to_formatted_s(:short)
    else
      @last_login = "never"
    end
  end

  def edit
  end

  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user, user_params)
                              @user.update(user_params)
                           else
                              @user.update_without_password(user_params)
                           end

    if successfully_updated
      flash[:notice] = "User successfully updated."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User successfully deleted."
    redirect_to users_path
  end

  private

    def user_params
      params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :role_id)
    end

    # def find_user
    #   @user = User.find(params[:id])
    # end

    def needs_password?(user, params)
      params[:password].present?
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
