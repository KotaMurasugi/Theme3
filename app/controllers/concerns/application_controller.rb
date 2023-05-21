class BooksController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  private

  def books_params
    params.require(:book).permit(:name, :body)
  end
end
