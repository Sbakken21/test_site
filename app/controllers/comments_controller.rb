class CommentsController < ApplicationController
    
    before_action :authenticate_user!
    before_filter :require_authorization, only: [:delete]
    

    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
          redirect_to @post
        else
          flash.now[:danger] = "error"
        end
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = current_user.comments.find(params[:id])
        if current_user == @comment.user
          @comment.destroy
        end
        redirect_to @post
    end
    
    private
    
        def comment_params
            params.require(:comment).permit(:body, :user_id, :post_id)
        end
        
        def require_authorization
          redirect_to @post unless current_user.comments.find_by_comment_id(params[:id])
        end
        
end
