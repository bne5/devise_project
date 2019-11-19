class VideoGamesController < ApplicationController
  before_action :set_video_game, only: [:show, :edit, :update]
  #calls setvideogame before any code in show, edit, and update

  def index
    @video_games = current_user.video_games
    #all video games for the current user, 
    #current_user devise helper grabs info for the user that 
    #is currently logged in
  end

  def show
  end

  def new
    @video_game = VideoGame.new
    #new video games
  end

  def edit
  end

  def create
    @video_game = current_user.video_games.new(video_game_params)
    #???????
    if @video_game.save
      flash[:success] = "Video Game Created"
      redirect_to video_games_path
    else
      flash[:error] = "Error #{@video_game.errors.full_messages.join("\n")}"
      render :edit
    #if something saves to video_games rediret to index else run edit
    end
  end

  def destroy
    @video_game.destroy
    #deletes a video game
    redirect_to video_games_path
    #redirects to index
  end

  def update
    if @video_game.update(video_game_params)
      redirect_to video_games_path
    else
      render :edit
    end
  end

  private

    def video_game_params
      params.require(:video_game).permit(:title, :played)
      #not 100 requires per
    end

    def set_video_account
      @video_game = current_user.video_games.find(params[:id])
      #finds video games by id for the current user
    end
    
end
