ActiveAdmin.register Category do
  menu parent: 'Administración'
  menu label: 'Categorías'

  config.batch_actions = false
  config.filters = false

  permit_params :name, :short_name, :description, :image

  form do |f|
    f.inputs 'Categoría' do
      f.input :name
      f.input :short_name
      f.input :description
      f.input :image, as: :file
    end
    f.actions
  end

  index title: 'Categorías' do
    column :name
    column :short_name
    column :description do |category|
      truncate(category.description, omision: '...', length: 100)
    end
    actions
  end

  show title: :name do
    attributes_table do
      row :name
      row :short_name
      row :description
      row :image do |ad|
        image_tag ad.image.variant(resize: '200x200>') if ad.image.attached?
      end
    end
  end
end
