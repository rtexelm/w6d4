# app/controllers/users_controller.rb

class CommentsController < ApplicationController

    def index
  
        if comment_author_id_params.nil?
            @comments = Comment.comments_for_artwork_id(comment_artwork_id_params)
        else
            @comments = Comment.comments_for_author_id(comment_author_id_params)
        end
  
      render json: @comments
    end
  
    def create
  
      comment = Comment.new(comment_params)
      if comment.save
        render json: comment
      else
        render json: comment.errors.full_messages, status: :unprocessable_entity
      end
    end
  
    def destroy
      comment = Comment.find(params[:id])
      comment.destroy
      render json: comment
    end
  
    private
  
    def comment_author_id_params
      params[:user_id]
    end

    def comment_artwork_id_params
        params[:artwork_id]
    end
  
    def comment_params
      params.require(:comment).permit(:author_id, :artwork_id, :body)
    end
  
  end