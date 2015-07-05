class User::PlayersController < ApplicationController

  def show_current
    if current_user.player.nil?
      redirect_to action: 'new'
    end
    @player = current_user.player
  end
end
