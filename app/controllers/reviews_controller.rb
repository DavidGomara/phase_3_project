class ReviewsController < ApplicationController
    before_action :find_instances_and_paths, only: [:new, :create, :edit, :update]

    def new
        @review = Review.new
    end 

    def edit
        @review = Review.find_by_id(params[:id])
    end 

    def create
        @review = Review.new(review_params)
        association_params
        if @review.save
          redirect_to @redirect_path
        else
          flash.now[:error] = @review.errors.full_messages
          render :new
        end
    end


    def update
        if @review.update(review_params)
            association_params
            redirect_to @redirect_path
        else
            flash.now[:error] = @review.errors.full_messages
            render :edit
        end
    end

    private

    def find_instances_and_paths
        if params[:song_id]
            @instance = Song.find_by_id(params[:song_id])
            @album = Album.find_by_id(params[:album_id])
            @artist = Artist.find_by_id(params[:artist_id])
            @path = artist_album_song_reviews_path(@artist, @album, @instance)
            @redirect_path = artist_album_song_path(@artist, @album, @instance)
        elsif params[:album_id]
            @instance = Album.find_by_id(params[:album_id])
            @artist = Artist.find_by_id(params[:artist_id])
            @path = artist_album_reviews_path(@artist, @instance)
            @redirect_path = artist_album_path(@artist, @instance)
        else
            @instance = Artist.find_by_id(params[:artist_id])
            @path = artist_reviews_path(@instance)
            @redirect_path = artist_path(@instance)
        end
    end 

    def review_params
        params.require(:review).permit(:description, :rating)
    end

    def association_params
        if params[:song_id]
            @review.song_id = params[:song_id]
            @review.user_id = session[:user_id]
        elsif params[:album_id]
            @review.album_id = params[:album_id]
            @review.user_id = session[:user_id]
        else
            @review.artist_id = params[:artist_id]
            @review.user_id = session[:user_id]
        end
    end 
end