class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.order(:id) # ID順に並び替え
  end

  def show
    @book = Book.find(params[:id])
  end
  

  def create
    @book = Book.new(book_params)
    if @book.save
      # redirect_to root_path, notice: 'Book was successfully created.'
      redirect_to @book, notice: 'Book was successfully created.'
    else
      @books = Book.all  
      render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
    
def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book)
  else
    flash[:alert] = "Error: Unable to update book."  # ← 任意
    render :edit  # ← ここで edit.html.erb に戻る！
  end
end

    
def destroy
  @book = Book.find(params[:id])
  if @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  else
    flash[:alert] = "Error: Unable to destroy book."
    redirect_to books_path
  end
end
  
  private
    
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
