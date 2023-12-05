class CommentsController < ApplicationController

  def create #コメントを登録する
    @book = Book.find(params[:book_id])
    comment = current_user.comment.new(comment_params)
    comment.book_id = @book.id
    comment.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    comment = Comment.find_by(id: params[:id])
    comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
