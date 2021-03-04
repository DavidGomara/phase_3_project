class AlbumsController < ApplicationController
    before_action :find_album, only: [:show, :edit, :update, :destroy]
    before_action :find_artist, only: [:show, :create, :update, :destroy, :new, :edit]

    def index
        @albums = Album.all
    end 

    def new
        @album = Album.new
    end 

    def create
        params
          @album = Album.new(album_params)
          @album.user_id = session[:user_id]
          @album.artist_id = params[:artist_id]
          if @album.save
            redirect_to artist_path(@artist)
          else
            flash.now[:error] = @album.errors.full_messages
            render :new
          end
    end

    def show
        @reviews = @album.reviews
    end

    def edit
    end

    def update
        if @album.update(album_params)
          redirect_to artist_album_path(@artist, @album)
        else
          flash.now[:error] = @album.errors.full_messages
          render :edit
        end
    end

    private 

    def find_artist
        @artist = Artist.find_by_id(params[:artist_id])
    end 

    def find_album
        @album = Album.find_by_id(params[:id])
    end 

    def album_params
        params.require(:album).permit(:name, :img)
    end
end