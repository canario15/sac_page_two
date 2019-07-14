ActiveAdmin.register SubCategory do
  actions :index, :show, :edit, :update, :new, :create

  menu parent: 'Administración', label: 'Sub Categorías'

  config.batch_actions = false
  config.filters = false

  permit_params :name, :category_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :category
    end
    f.actions
  end

  index do
    column :name
    column :category
    actions
  end

  show title: :name do
    attributes_table do
      row :name
      row :category
    end
  end
end
