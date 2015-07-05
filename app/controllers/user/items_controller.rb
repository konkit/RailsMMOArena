class User::ItemsController < ApplicationController

  def buy
    if current_user.player.buy_item( Item.find(params[:id]) )
      render status: 200
    else
      render status: 400, text: 'Not enough money'
    end
  end

  def sell
    current_user.player.sell_item( Item.find(params[:id]) )
  end

end
