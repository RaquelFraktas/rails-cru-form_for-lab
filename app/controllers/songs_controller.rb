class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

   def show
     @song = current_song
     @genre= current_song.genre
     @artist = current_song.artist
   end  

   def new
       @song = Song.new
   end  

   def create
       song = Song.create(song_params)
       redirect_to song_path(song)
   end  

   def edit
       @song = current_song
   end  

   def update
       song = Song.update(song_params)
       redirect_to song_path(song)
   end  

   private  
   def song_params
       params.require(:song).permit(:name, :artist_id, :genre_id)
   end
   
   def current_song
       Song.find(params[:id])
   end
    
end
