require 'open-uri'
require 'json'

#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

#item_types = ['Card', 'Deck', 'Booster', 'Set'];

#item_types.each do |type|

#new_item_type = ItemType.new
#   new_item_type.name = type
#   new_item_type.save
#end

#game_types = ['Pokemon TGC', 'Magic: The Gathering']

#game_types.each do |game|
#    new_game_type = GameType.new
#    new_game_type.name = game
#    new_game_type.save
#end

#order_statuses = ['Awaiting Payment', 'Paid', 'On Delivery', 'Delivered', 'Canceled']

#order_statuses.each do |status|
#    new_order_status = OrderStatus.new
#    new_order_status.status = status
#    new_order_status.save
#end

def fetch(url)
    JSON.parse(URI.open(url).read)
end

#pokemon_rarities = fetch("https://api.pokemontcg.io/v2/rarities")

#pokemon_rarities['data'].each do |rarity|
#    new_rarity = Rarity.new
#    new_rarity.name = rarity
#    new_rarity.save
#end

#new_member = Member.new(full_name:'test', username:'test', password:'test', address:'test', store_credit_available: 0)
#new_member.save

pokemon_cards = fetch("https://api.pokemontcg.io/v2/cards?pageSize=2")

pokemon_cards['data'].each do |pokemon|
    new_item = Item.new
    new_item.name = pokemon['name']
    new_item.stock = 1
    new_item.price = pokemon['cardmarket']['prices']['averageSellPrice']
    new_item.item_type = ItemType.find_or_create_by(name: 'Card')
    new_item.rarity = Rarity.find_or_create_by(name: pokemon['rarity'])
    new_item.game_type = GameType.find_or_create_by(name: 'Pokemon TCG')
    new_item.save

    file = URI.open(pokemon['images']['large'])
    new_item.image.attach(io: file, filename: 'image.png')
end
