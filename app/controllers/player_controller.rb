class PlayerController < ApplicationController

  def index
    @player = Player.find(params[:id])
  end

  def show_with_items_and_spells
    render json: Player.find(params[:id]).as_json(:include => [:items, :spells])
  end

end
