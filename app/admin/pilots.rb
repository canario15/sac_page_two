ActiveAdmin.register Pilot do
  actions :index, :show, :edit, :update, :new, :create

  menu parent: 'Administración', label: 'Pilotos'

  config.batch_actions = false
  config.per_page = 15

  filter :categories, collection: proc { Category.all }, as: :select
  filter :last_name

  permit_params :active, :first_name, :last_name, :full_name, :car, :team,
                :avatar, :car_pic, :complete_pic, :helmet_pic, :city,
                :birth_date, category_ids: []

  form do |f|
    f.inputs do
      f.input :active
      f.input :first_name
      f.input :last_name
      f.input :birth_date, as: :datepicker
      f.input :city
      f.input :car, as: :select, collection: CARS_LIST
      f.input :team
      f.input :categories, as: :check_boxes
      f.input :avatar, as: :file
      f.input :car_pic, as: :file
      f.input :helmet_pic, as: :file
      f.input :complete_pic, as: :file
    end
    f.actions
  end

  index do
    column :full_name
    column :birth_date
    column :city
    column :car
    column :team
    column :categories
    column :active
    actions
  end

  show title: :full_name do |ad|
    attributes_table do
      row :active
      row :full_name
      row :birth_date
      row :city
      row :car
      row :team
      row :categories
      row :avatar do
        if ad.avatar.attached?
          image_tag ad.avatar.variant(resize: '200x200>')
        end
      end
      row :car_pic do
        if ad.car_pic.attached?
          image_tag ad.car_pic.variant(resize: '200x200>')
        end
      end
      row :helmet_pic do
        if ad.helmet_pic.attached?
          image_tag ad.helmet_pic.variant(resize: '200x200>')
        end
      end
      row :complete_pic do
        if ad.complete_pic.attached?
          image_tag ad.complete_pic.variant(resize: '200x200>')
        end
      end
    end
  end
end
