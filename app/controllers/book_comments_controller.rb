class BookCommentsController < ApplicationController
	def create
		@book =Book.find(params[:book_id])
		@book_comment = book.book_comments.build(book_comment_params)
		@book_comment.save
		redirect_to book_path(book)
	end
	def destroy
    book =Book.find(params[:book_id])
    book_comment = book.book_comments.find(params[:id])
    book_comment.destroy
    redirect_to book_path(book)
	end

   private
   def book_comment_params
   	params.require(:book_comment).permit(:comment)
   end

end

