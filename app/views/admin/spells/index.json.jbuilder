json.array!(@spells) do |spell|
  json.extract! spell, :id
  json.url admin_spell_url(spell, format: :json)
end
