class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all
  end

  # GET /photo_albums/1
  # GET /photo_albums/1.json
  def show
  end

  # GET /photo_albums/new
  def new
    @album = Album.new
  end

  # GET /photo_albums/1/edit
  def edit
  end

  # POST /photo_albums
  # POST /photo_albums.json
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Photo album was successfully created.' }
        format.json { render action: 'show', status: :created, location: @album }
      else
        format.html { render action: 'new' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photo_albums/1
  # PATCH/PUT /photo_albums/1.json
  def update
    respond_to do |format|
      if @album.update(photo_album_params)
        format.html { redirect_to @album, notice: 'Photo album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_albums/1
  # DELETE /photo_albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to photo_album_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :description)
    end
         
end
