class AddUserToPlayer < ActiveRecord::Migration
  def change
    add_reference :players, :user
  end
end
