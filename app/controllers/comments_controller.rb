class CommentsController < ApplicationController
    
    before_action :authenticate_user!
    load_and_authorize_resource param_method: :my_sanitizer
    load_and_authorize_resource :through => :current_user
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:name, :body))
        
        redirect_to post_path(@post)
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        
        redirect_to post_path(@post)
    end
    
    private
    
        def my_sanitizer
            params.require(:comment).permit(:body)
        end
        
        
end
