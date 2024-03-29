ActiveAdmin.register ItemType do
  remove_filter :items
  permit_params :name

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      end
    end
  
end
