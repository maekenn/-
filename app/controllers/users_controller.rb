class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books


  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def create
   user = User.new(user_params)
   user.save
   redirect_to user_path(id: current_user)
  end

  def edit
   @user = User.find(params[:id])

  end

  def update
	  @user = User.find(params[:id])
	 if @user.update(user_params)
	  flash[:notice] = "You have updated user successfully."
	  redirect_to user_path(@user.id)
	 else
	  render :edit
	 end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :user_id, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
     unless @user == current_user
     redirect_to user_path(current_user)
     end
  end


end
