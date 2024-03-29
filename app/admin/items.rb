ActiveAdmin.register Item do
  remove_filter :image_attachment
  remove_filter :image_blob
  remove_filter :item_type
  remove_filter :rarity
  remove_filter :game_type

  permit_params :name, :stock, :price, :rarity_id, :item_type_id, :game_type_id, :image

  form do |f|
    f.inputs do
      f.input :name
      f.input :stock
      f.input :price
      f.input :rarity_id, :label => "Rarity", as: :select, collection: Rarity.all.collect {|rarity| [rarity.name, rarity.id] }, include_blank: true
      f.input :item_type_id, :label => "ItemType", as: :select, collection: ItemType.all.collect {|item_type| [item_type.name, item_type.id] }, include_blank: true
      f.input :game_type_id, :label => "GameType", as: :select, collection: GameType.all.collect {|game_type| [game_type.name, game_type.id] }, include_blank: true
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :stock
      row :price
      row :rarity
      row :item_type
      row :game_type
      row :image do |ad|
        link_to ad.image.filename, rails_blob_path(ad.image, disposition: 'attachment') if ad.image.attached?
      end
    end
  end
  
end
