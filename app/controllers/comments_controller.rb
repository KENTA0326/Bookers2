class CommentsController < ApplicationController

  def create #コメントを登録する
    book = Book.find(params[:book_id])
    comment = current_user.comment.new(comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to books_path
  end 
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
