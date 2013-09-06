class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comments_params)
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to article_url(@comment.article_id)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to article_url(@comment.article_id)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to article_url(@comment.article_id)
  end

  private
  def comments_params
    params.require(:comment).permit(:article_id,:author_name,:content,:site_url)
  end
end
