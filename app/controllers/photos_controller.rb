class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
  @album = Album.find(params[:album_id])
    @photos = @album.photos.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  
  @album = Album.find(params[:album_id])
   @photo = Photo.find(params[:id])
   
   
  end

  # GET /photos/new
  def new
    @album = Album.find(params[:album_id])
    @photo = @album.photos.new
  end

  # GET /photos/1/edit
  def edit
   @album = Album.find(params[:album_id])
   @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
   @album = Album.find(params[:album_id])
    @photo = @album.photos.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to [@album,@photo], notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
   @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to [@album,@photo], notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
  @photo = Photo.find(params[:id])
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
     private
  def photo_params
    params.require(:photo).permit(:name, :description, :image)
  end
end
