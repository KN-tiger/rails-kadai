class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
    flash[:notice] = "Book was successfully created."
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @bookf = Book.find(params[:id])
  end

  def edit
    @bookf = Book.find(params[:id])

  end

  def update
    @bookf = Book.find(params[:id])
    
    if @bookf.update(book_params)
     redirect_to book_path(@bookf.id)
    else
     render :edit
    end
    
    flash[:notice] = "Book was successfully updated."
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
    flash[:notice] = "Book was successfully destroyed."
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
