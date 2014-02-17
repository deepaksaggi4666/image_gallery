class CommentsController < ApplicationController
 def create
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment_params)
    redirect_to album_photo_path(@album,@photo)
  end
 
  def destroy
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.find(params[:id])
    @comment.destroy
    redirect_to album_photo_path(@album,@photo)
  end
  def show
  
  end
  private
    def comment_params
      params.require(:comment).permit(:user, :body)
    end
end
