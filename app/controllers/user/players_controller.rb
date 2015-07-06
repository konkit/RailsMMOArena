class User::PlayersController < ApplicationController

  def show_current
    if current_user.player.nil?
      redirect_to new_user_player_path
    end
    @player = current_user.player
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # POST /pla  get 'players/current' => 'players#show_current'yers
  # POST /players.json
  def create
    @player = Player.new(player_params)
    @player.user = current_user

    respond_to do |format|
      if @player.save
        format.html { redirect_to user_players_current_path, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params[:player].permit(:name)
    end
end
