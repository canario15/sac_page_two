# frozen_string_literal: true

ActiveAdmin.register Notice do
  config.batch_actions = false
  config.filters = false

  menu label: 'Noticias'

  permit_params :title, :context, :image

  form do |f|
    f.inputs 'Noticia' do
      f.input :title
      f.input :context
      f.input :image, as: :file
    end
    f.actions
  end

  index title: 'Noticias' do
    column :id
    column :title
    column :created_at
    column :context do |notice|
      truncate(notice.context, omision: '...', length: 100)
    end
    actions
  end

  show title: :title do
    attributes_table do
      row :id
      row :title
      row :created_at
      row :context
      row :image do |ad|
        image_tag ad.image.variant(resize: '200x200>') if ad.image.attached?
      end
    end
  end
end
