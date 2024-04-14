require 'open-uri'
require 'json'
require 'nokogiri'

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

#pokemon_cards = fetch("https://api.pokemontcg.io/v2/cards?pageSize=100")

#pokemon_cards['data'].each do |pokemon|
#    new_item = Item.new
#    new_item.name = pokemon['name']
#    new_item.stock = 1
#    new_item.price = pokemon['cardmarket']['prices']['averageSellPrice']
#    new_item.item_type = ItemType.find_or_create_by(name: 'Card')
#    new_item.rarity = Rarity.find_or_create_by(name: pokemon['rarity'])
#    new_item.game_type = GameType.find_or_create_by(name: 'Pokemon TCG')
#    new_item.save

#    file = URI.open(pokemon['images']['large'])
#    new_item.image.attach(io: file, filename: 'image.png')
#end

####BOOSTER PACK SCRAPPING########
new_item = Item.new
new_item.stock = 1
new_item.item_type = ItemType.find_or_create_by(name: 'Booster')
new_item.game_type = GameType.find_or_create_by(name: 'Pokemon TCG')
new_item.rarity = Rarity.find_or_create_by(name: 'Common')

booster = URI.open("https://www.fusiongamingonline.com/catalog/pokemon_sealed_products-pokemon_booster_packs/scarlet__violet__base_set_booster_pack/1703908").read
booster_doc = Nokogiri::HTML(booster)
booster_name_selector = 'div.product-info'
booster_price_selector = 'div.product-price-qty'

booster_pack_name = booster_doc.css(booster_name_selector)
booster_pack_price = booster_doc.css(booster_price_selector)

booster_pack_name.each do |booster|
    new_item.name = booster.at_css('h1').content
    puts new_item.name
end

booster_pack_price.each do |booster|
    price = booster.at_css('span').content
    array= price.split
    new_item.price = array[1].to_f
    puts new_item.price
    break
end

new_item.save

image = booster_doc.at_css('#main-image img').attr('src')
puts image

file = URI.open(image)
new_item.image.attach(io: file, filename: 'image.png') 

#######SET SCRAPPING#########
new_item = Item.new
new_item.stock = 1
new_item.item_type = ItemType.find_or_create_by(name: 'Set')
new_item.game_type = GameType.find_or_create_by(name: 'Pokemon TCG')
new_item.rarity = Rarity.find_or_create_by(name: 'Common')

set = URI.open("https://www.fusiongamingonline.com/catalog/pokemon_sealed_products-pokemon_tins__box_sets/crown_zenith_pikachu_vmax_special_collection/1699694").read
set_doc = Nokogiri::HTML(set)
set_name_selector = 'div.product-info'
set_price_selector = 'div.product-price-qty'

set_pack_name = set_doc.css(set_name_selector)
set_pack_price = set_doc.css(set_price_selector)

set_pack_name.each do |set|
    new_item.name = set.at_css('h1').content
    puts new_item.name
end

set_pack_price.each do |set|
    price = set.at_css('span').content
    array= price.split
    new_item.price = array[1].to_f
    puts new_item.price
    break
end

new_item.save

image = set_doc.at_css('#main-image img').attr('src')
puts image

file = URI.open(image)
new_item.image.attach(io: file, filename: 'image.png') 

####DECK SCRAPPING######
new_item = Item.new
new_item.stock = 1
new_item.item_type = ItemType.find_or_create_by(name: 'Deck')
new_item.game_type = GameType.find_or_create_by(name: 'Pokemon TCG')
new_item.rarity = Rarity.find_or_create_by(name: 'Common')

deck = URI.open("https://www.fusiongamingonline.com/catalog/pokemon_sealed_products-pokemon_preconstructed_theme_decks/zapdos_ex_deluxe_battle_deck/1732990").read
deck_doc = Nokogiri::HTML(deck)
deck_name_selector = 'div.product-info'
deck_price_selector = 'div.product-price-qty'

deck_pack_name = deck_doc.css(deck_name_selector)
deck_pack_price = deck_doc.css(deck_price_selector)

deck_pack_name.each do |deck|
    new_item.name = deck.at_css('h1').content
    puts new_item.name
end

deck_pack_price.each do |deck|
    price = deck.at_css('span').content
    array= price.split
    new_item.price = array[1].to_f
    puts new_item.price
    break
end

new_item.save

image = deck_doc.at_css('#main-image img').attr('src')
puts image

file = URI.open(image)
new_item.image.attach(io: file, filename: 'image.png') 

new_province = Province.new
new_province.name = 'Alberta'
new_province.shortname = 'AB'
new_province.GST = 0
new_province.PST = 5
new_province.HST = 0
new_province.save

new_province = Province.new
new_province.name = 'British Columbia'
new_province.shortname = 'BC'
new_province.GST = 7
new_province.PST = 5
new_province.HST = 0
new_province.save

new_province = Province.new
new_province.name = 'Manitoba'
new_province.shortname = 'MB'
new_province.GST = 7
new_province.PST = 5
new_province.HST = 0
new_province.save

new_province = Province.new
new_province.name = 'New Brunswick'
new_province.shortname = 'NB'
new_province.GST = 0
new_province.PST = 0
new_province.HST = 15
new_province.save

new_province = Province.new
new_province.name = 'Newfoundland and Labrador'
new_province.shortname = 'NL'
new_province.GST = 0
new_province.PST = 0
new_province.HST = 15
new_province.save

new_province = Province.new
new_province.name = 'Nova Scotia'
new_province.shortname = 'NS'
new_province.GST = 0
new_province.PST = 0
new_province.HST = 15
new_province.save

new_province = Province.new
new_province.name = 'Nunavut'
new_province.shortname = 'NU'
new_province.GST = 0
new_province.PST = 5
new_province.HST = 0
new_province.save

new_province = Province.new
new_province.name = 'Ontario'
new_province.shortname = 'ON'
new_province.GST = 0
new_province.PST = 0
new_province.HST = 13
new_province.save

new_province = Province.new
new_province.name = 'Prince Edward Island'
new_province.shortname = 'PE'
new_province.GST = 0
new_province.PST = 0
new_province.HST = 15
new_province.save

new_province = Province.new
new_province.name = 'Quebec'
new_province.shortname = 'QC'
new_province.GST = 9.975
new_province.PST = 5
new_province.HST = 0
new_province.save

new_province = Province.new
new_province.name = 'Saskatchewan'
new_province.shortname = 'SK'
new_province.GST = 6
new_province.PST = 5
new_province.HST = 0
new_province.save

new_province = Province.new
new_province.name = 'Yukon'
new_province.shortname = 'YT'
new_province.GST = 0
new_province.PST = 5
new_province.HST = 0
new_province.save
