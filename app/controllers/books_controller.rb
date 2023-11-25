class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.new
    @book_detail = Book.find(params[:id])
    @books = Book.all
    
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
    if @user.id != current_user.id
      redirect_to books_path
    end 
  end

  def update
    @book = Book.find(params[:id])
  if @book.update(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
  else
    render :edit
  end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :index
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
