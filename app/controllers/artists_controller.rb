class ArtistsController < ApplicationController
    before_action :find_artist, only: [:show, :edit, :update, :destroy]

    def index
        @artists = Artist.all
    end 

    def new
        @artist = Artist.new
    end 

    def create
      @artist = Artist.new(artist_params)
      @artist.user_id = session[:user_id]
      if @artist.save
        redirect_to artists_path
      else
        flash.now[:error] = @artist.errors.full_messages
        render :new
      end
    end

    def show
        @reviews = @artist.reviews
    end

    def edit
    end

    def update
        if @artist.update(artist_params)
          redirect_to artist_path(@artist)
        else
          flash.now[:error] = @artist.errors.full_messages
          render :edit
        end
    end

    private 

    def find_artist
        @artist = Artist.find_by_id(params[:id])
    end 

    def artist_params
        params.require(:artist).permit(:name, :bio, :img)
    end
end