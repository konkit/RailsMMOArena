

class WelcomeController < ApplicationController
  def index
    if current_user.admin_role?
      redirect_to admin_players_path
    else
      redirect_to user_players_current_path
    end
  end
end