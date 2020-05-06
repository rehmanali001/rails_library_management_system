class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index 
        if params[:book_id] && @book = Book.find_by_id(params[:book_id])
            @comments = @book.comments
        else   
            @comments = Comment.all
        end
    end 

    def new 
        if params[:book_id] && @book = Book.find_by_id(params[:book_id])
            @comment = @book.comments.build
        else  
            @comment = Comment.new
        end 
    end 

    def create 
        @comment = current_user.comments.build(comment_params)
        if @comment.save 
            redirect_to comments_path
        else 
            render :new 
        end
    end 

    def show 
        @comment = Comment.find_by(id: params[:id])
    end 

    def edit 
        @comment = Comment.find_by(id: params[:id])
    end 

    def update
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else 
            render :edit 
        end 
    end 

    private 

    def comment_params
        params.require(:comment).permit(:content, :book_id)
    end 
end
