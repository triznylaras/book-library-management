class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def add
    @book = Book.new(book_params)

    if @book.save
      redirect_to index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :borrow_time, :return_due_date)
  end
end
