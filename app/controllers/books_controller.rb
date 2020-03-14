class BooksController < ApplicationController


  def index
    @book =Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  	@book =Book.new
  end

  def create
# ストロングパラメーター使用
       @book = Book.new(book_params)
       @books = Book.all
     if @book.save
       flash.now[:create]= 'Book was successfully successfully.'
       redirect_to book_path(@book.id)
     else
       render action: :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

# ２つ追加して記入
  def update
     if book = Book.find(params[:id])
        book.update(book_params)
        flash[:update]= 'Book was successfully update.'
        redirect_to book_path
     end
  end

  def destroy
    if book = Book.find(params[:id])
       book.destroy
       flash[:destroy]= 'Book was successfully destroyed.'
       redirect_to books_path
  end
end
# ここまで

private

  def book_params
     params.require(:book).permit(:title, :body)
  end
end
