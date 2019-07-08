ActiveAdmin.register Race do
  actions :index, :edit, :show, :update

  config.batch_actions = false
  config.filters = false

  menu false

  permit_params :city, :date, :name, :observation, :circuit_id, steps_attributes: [:id, :number, :name, :_destroy], pilot_races_attributes: [:id, :number, :pilot_id, :race_id]

  action_item only: :show do
    link_to 'Cerrar Fecha', '#', class: 'close_race'
  end

  form do |f|
    f.inputs 'Fecha' do
      f.input :championship, input_html: { disabled: true }
      f.input :date, as: :datepicker
      f.input :city
      f.input :circuit
      f.input :name
      f.has_many :steps, allow_destroy: true do |s|
        s.input :number
        s.input :name
      end
      f.has_many :pilot_races, allow_destroy: true do |p|
        p.input :pilot, as: :select, collection: (resource.championship.category ? resource.championship.category.pilots.collect {|pilot| [pilot.full_name, pilot.id]} : [])
        p.input :number
      end

      f.input :observation
    end
    f.actions
  end

  index title: 'Fechas' do
    column :championship
    column :date
    column :city
    column :name
    column :circuit
    actions
  end

  show do
    attributes_table do
      row :done
      row :id
      row :championship
      row :date
      row :city
      row :circuit
      row :name
      row :steps do
        table_for race.steps do
          column :number
          column :name
          column('Acciones') { |step| link_to('Ver', admin_step_path(step)) }
          column('') { |step| link_to('Editar', edit_admin_step_path(step)) }
        end
      end
      row :pilot_races do
        table_for race.pilot_races do
          column :number
          column :pilot
          column('Acciones') { |pilot_race| link_to('Ver', admin_pilot_race_path(pilot_race)) }
          column('') { |pilot_race| link_to('Editar', edit_admin_pilot_race_path(pilot_race)) }
        end
      end
      row :observation
    end
  end

end
