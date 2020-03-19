class UsersController < ApplicationController
before_action :authenticate_user!, only: [:show,:index,:edit,:info,:update]
before_action :correct_user, only: [:edit, :update]
def show
  @user = User.find(params[:id])
  @books = @user.books.all
  @bookn = Book.new
end
def top
  
end
def about
  
end
def index
  @users = User.all
  @bookn = Book.new
    @user = current_user
end

def edit
  @user = User.find(params[:id])

end
    def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:hoge] = "User_info was successfully updated"
    redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
      def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
end
def info
  user = User.find(params[:id])
  
end
private 
def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
end
  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end

end