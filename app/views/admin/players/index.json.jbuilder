json.array!(@players) do |player|
  json.extract! player, :id
  json.url admin_player_url(player, format: :json)
end
