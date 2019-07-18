# frozen_string_literal: true

ActiveAdmin.register Circuit do
  actions :index, :show, :edit, :update, :new, :create

  menu parent: 'Administración', label: 'Circuitos'

  config.batch_actions = false
  config.filters = false

  permit_params :name, :location, :description, :large, :logo, :map_position,
                :video_url, :truck

  form do |f|
    f.inputs do
      f.input :name
      f.input :location
      f.input :large
      f.input :description
      f.input :map_position
      f.input :video_url
      f.input :logo, as: :file
      f.input :truck, as: :file
    end
    f.actions
  end

  index do
    column :name
    column :location
    column :large
    actions
  end

  show title: :name do |ad|
    attributes_table do
      row :name
      row :location
      row :large
      row :description
      row :logo do
        image_tag ad.logo.variant(resize: '200x200>') if ad.logo.attached?
      end
      row :truck do
        image_tag ad.truck.variant(resize: '200x200>') if ad.truck.attached?
      end
    end
  end
end
