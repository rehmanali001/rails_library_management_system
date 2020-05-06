class BooksController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @books = @user.books.alpha
        else  
            @books = Book.alpha
        end 
    end 

    def new 
         @book = Book.new
    end 

    def create
        @book = current_user.books.build(book_params)
        if @book.save
            redirect_to book_path(@book)
        else   
            render :new
        end 
    end 

    def show 
        @book = Book.find_by_id(params[:id])
    end 

    def edit 

    end 
  

    private 

    def book_params
        params.require(:book).permit(:title, :description, :genre_id)
    end     
end
