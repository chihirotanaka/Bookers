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
    if @book.save
      flash[:complete]="creates item!"

        format.html { redirect_to @book, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end

  def edit
    @book = Book.find(params[:id])
  end

# ２つ追加して記入
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
# ここまで

private

  def book_params
     params.require(:book).permit(:title, :body)
  end

end
