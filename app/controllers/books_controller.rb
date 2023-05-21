class BooksController < ApplicationController
  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "You have created book failed."
      @user = current_user
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
        flash[:notice] = "You have updated book successfully."
        redirect_to book_path(@book.id)
     else
        flash[:notice] = "You have updated book failed."
        render :edit
     end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_user
    book = Book.find(params[:id])
    user_id = book.user_id
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to '/books'
    end
  end
end
