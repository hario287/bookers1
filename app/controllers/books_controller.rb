class BooksController < ApplicationController
   def new
   @book = Book.new
   # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成。
   end

  def create
    @book = Book.new(book_params)
    if @book.save
    flash[:success] = "Book was successfully createdd."
    redirect_to "/books/#{@book.id}"
    else
    @books = Book.all
    render "index"
    end

  end

  def index
     @books = Book.all
     @book = Book.new
  end




  def show
    @book = Book.find(params[:id])
  end

  def edit
   @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:success] = "Book was successfully updated."
    redirect_to "/books/#{@book.id}"
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
    flash[:success] = "Book was successfully destroyed."
    redirect_to "/books"
    else
      render "index"
    end
end


private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
