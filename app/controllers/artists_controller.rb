class ArtistsController < ApplicationController
    def index
    end

    def show
      @artist = current_artist
    end

    def new
        @artist = Artist.new
    end

    def create
        artist = Artist.create(artist_params)
        redirect_to artist_path(artist)
    end

    def edit
        @artist = current_artist
    end

    def update
        artist = Artist.update(artist_params)
        redirect_to artist_path(artist)
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end
    
    def current_artist
        Artist.find(params[:id])
    end

end
