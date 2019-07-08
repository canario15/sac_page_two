ActiveAdmin.register Championship do
  actions :index, :show, :edit, :update, :new, :create

  config.batch_actions = false
  filter :category, collection: proc { Category.all }, as: :select

  menu label: 'Campeonatos'

  config.sort_order = 'year_desc'

  permit_params :name, :category_id, :circuit_id, :year, :one_id,
                :two_id, :three_id, races_attributes: [:id, :city, :date, :name, :circuit_id, :_destroy]

  form do |f|
    f.inputs 'Campeonato' do
      f.input :name
      f.input :year
      f.input :category, as: :select, collection: Category.all.collect {|cat| [cat.name, cat.id] }
      f.input :one
      f.input :two
      f.input :three
      f.has_many :races, allow_destroy: true do |r|
        r.input :city
        r.input :date, as: :datepicker
        r.input :name
        r.input :circuit
      end
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
      row :races do
        table_for championship.races do
          column :date
          column :city
          column :name
          column :circuit
          column :done
          column('Acciones') { |race| link_to('Ver', admin_race_path(race)) }
          column('') { |race| link_to('Editar', edit_admin_race_path(race)) }
        end
      end
    end
  end
end
