class BooksController < ApplicationController
  def top
  end
  
  def index
    @book=Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book=Book.new(book_params)
    if @book.save
      flash[:notice]="successfully 投稿完了"
      redirect_to book_path(@book)
    else
      @books=Book.all
      render :index
    end
  end
  
  def edit
    @book=Book.find(params[:id])
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="successfully 編集完了"
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
