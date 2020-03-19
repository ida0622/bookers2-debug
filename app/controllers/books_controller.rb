class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  def index
    @books = Book.all
    @bookn = Book.new
    @user = current_user
  end

  def show
    @bookn =Book.new
    @book = Book.find_by(id: params[:id])
    @user = User.find_by(id: @book.user_id)
   
  end

  def new
    @bookn = Book.new
  end
  def create
      @user = current_user
      @bookn = Book.new(book_params)
      @bookn.user = current_user
      if @bookn.save
        flash[:hote] = "Book was successfully created"
        redirect_to book_path(@bookn)
        else
          flash[:hoti] = "error Book was not created"
          redirect_to books_path
      
        end
   end
  def edit
    @book = Book.find(params[:id])
  end
    def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:hoge] = "Book was successfully updated"
    redirect_to book_path(@book)
    else
      render 'edit'
    end
  end
      def delete
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
end
private 
def book_params
    params.require(:book).permit(:title,:body,:user_id)
end
  def correct_user
    book =  Book.find(params[:id])
    user = book.user_id
    if current_user.id != user
      redirect_to books_path
    end
  end


end
