class SongsController < ApplicationController
    before_action :find_album, only: [:show, :edit, :update, :destroy, :create, :new]
    before_action :find_artist, only: [:show, :create, :update, :destroy, :new, :edit]
    before_action :find_song, only: [:show, :create, :update, :destroy, :new, :edit]

    def index
        @songs = Song.all
    end 

    def new
        @song = Song.new
    end 

    def create
        params
          @song = Song.new(song_params)
          @song.user_id = session[:user_id]
          @song.album_id = params[:album_id]
          if @song.save
            redirect_to artist_album_path(@artist, @album)
          else
            flash.now[:error] = @song.errors.full_messages
            render :new
          end
    end

    def show
        if @song.genre_id
            @genre = Genre.find_by_id(@song.genre_id)
        end 
        @reviews = @song.reviews
        @avg = Review.average_of_instance(@song)
    end

    def edit
    end

    def update
        if @song.update(song_params)
          redirect_to artist_album_song_path(@artist, @album, @song)
        else
          flash.now[:error] = @song.errors.full_messages
          render :edit
        end
    end

    private 

    def find_artist
        @artist = Artist.find_by_id(params[:artist_id])
    end 

    def find_album
        @album = Album.find_by_id(params[:album_id])
    end 

    def find_song
        @song = Song.find_by_id(params[:id])
    end 

    def song_params
        params.require(:song).permit(:name, :genre_id)
    end
end