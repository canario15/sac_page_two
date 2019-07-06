ActiveAdmin.register Championship do
  actions :index, :show, :edit, :update, :new, :create

  config.batch_actions = false
  filter :category, collection: proc { Category.all }, as: :select

  menu label: 'Campeonatos'

  config.sort_order = 'year_desc'

  permit_params :name, :category_id, :circuit_id, :year, :one_id,
                :two_id, :three_id

  form do |f|
    f.inputs 'Campeonato' do
      f.input :name
      f.input :year
      f.input :category, as: :select, collection: Category.all.collect {|cat| [cat.name, cat.id] }
      f.input :one
      f.input :two
      f.input :three
    end
    f.actions
  end

  index title: 'Campeonatos' do
    column :name
    column :year
    column :category
    column :one
    column :two
    column :three
    actions
  end

  show title: :name do
    attributes_table do
      row :name
      row :year
      row :category
      row :one
      row :two
      row :three
    end
  end
end
