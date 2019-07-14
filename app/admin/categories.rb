ActiveAdmin.register Category do
  actions :index, :show, :edit, :update, :new, :create

  menu parent: 'Administración', label: 'Categorías'

  config.batch_actions = false
  config.filters = false

  permit_params :name, :short_name, :description, :image

  form do |f|
    f.inputs do
      f.input :name
      f.input :short_name
      f.input :description
      f.input :image, as: :file
    end
    f.actions
  end

  index do
    column :name
    column :short_name
    column :sub_categories do |sub_cat|
      (sub_cat.sub_categories.map {|c| c.name }).join(', ')
    end
    column :description do |category|
      truncate(category.description, omision: '...', length: 100)
    end
    actions
  end

  show title: :name do
    attributes_table do
      row :name
      row :short_name
      row :sub_categories
      row :description
      row :image do |ad|
        image_tag ad.image.variant(resize: '200x200>') if ad.image.attached?
      end
    end
  end
end
