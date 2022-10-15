class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Data transaksi peminjaman buku berhasil ditambahkan." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @books = Book.all

    case params[:search_by]
    when 'title'
      @results = @books.where("lower(title) LIKE ?", "%#{params[:search].downcase}%")
    when 'author'
      @results = @books.where("lower(author) LIKE ?", "%#{params[:search].downcase}%")
    when 'borrow_time'
      @results = @books.where("lower(borrow_time) LIKE ?", "%#{params[:search].downcase}%")
    when 'return__due_date'
      @results = @books.where("lower(return_due_date) LIKE ?", "%#{params[:search].downcase}%")
    else
      redirect_to('index', alert: "Empty field!")
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :borrow_time, :return_due_date)
  end
end
