class BooksController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @books = @user.books.alpha
        else  
            @books = Book.alpha.includes(:genre, :user)
        end 
    end 

    def new 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @book = @user.books.build
        else 
            @book = Book.new        
        end 
    end 

    def create
        @book = current_user.books.build(book_params)
        if @book.save
            redirect_to books_path
        else   
            render :new
        end 
    end 

    def show 
        @book = Book.find_by_id(params[:id])
        redirect_to books_path if !@book
    end 

    def edit 
        @book = Book.find_by_id(params[:id])
        redirect_to books_path if !@book || @book.user != current_user
        @book.build_genre if !@book.genre
    end 

    def update 
        @book = Book.find_by(id: params[:id])
        redirect_to books_path if !@book || @book.user != current_user
        if @book.update(book_params)
            redirect_to book_path(@book)
        else 
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
        params.require(:book).permit(:title, :description, :genre_id, genre_attributes: [:name])
    end     
end
