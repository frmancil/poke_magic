ActiveAdmin.register Item do
  remove_filter :image_attachment
  remove_filter :image_blob
  remove_filter :item_type
  remove_filter :rarity
  remove_filter :game_type

  permit_params :name, :stock, :price, :rarity, :image

  form do |f|
    f.inputs do
      f.input :name
      f.input :stock
      f.input :price
      f.input :rarity
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
      row :image do |ad|
        link_to ad.image.filename, rails_blob_path(ad.image, disposition: 'attachment') if ad.image.attached?
      end
    end
  end
  
end
