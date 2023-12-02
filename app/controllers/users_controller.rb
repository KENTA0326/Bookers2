class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @following_users = @user.following_users
    @follower_users = @user.follower_users
  end

  def edit
    @user = current_user
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Book was successfully created."
      redirect_to user_path(@user.id)
    else
    render :edit
    end
  end 
  
  def follows
  user = User.find(params[:id])
  @users = user.following_users
  end
  
  # フォロワー一覧
  def followers
    user = User.find(params[:id])
    @user = user.follower_users
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
