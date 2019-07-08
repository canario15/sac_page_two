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
      row :id
      row :championship
      row :date
      row :city
      row :circuit
      row :name
      row :done
      row :observation
    end
  end

end
