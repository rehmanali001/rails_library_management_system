class CommentsController < ApplicationController

    def index 
        @comments = Comment.all
    end 

    def new 
        @comment = Comment.new
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

    end 

    private 

    def comment_params
        params.require(:comment).permit(:content, :book_id)
    end 
end
