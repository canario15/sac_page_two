ActiveAdmin.register Step do
  actions :index, :edit, :show, :update

  config.batch_actions = false
  config.filters = false

  menu false

  permit_params :number, :name, :observation, pilot_steps_attributes: [:id, :pilot_race_id, :position, :time, :score, :_destroy]

  form do |f|
    f.inputs 'Fecha' do
      f.input :race, input_html: { disabled: true }
      f.input :number, input_html: { disabled: true }
      f.input :name, input_html: { disabled: true }
      f.input :observation
    end
    f.actions
  end

  show title: :name do
    attributes_table do
      row :race
      row :number
      row :name
      row :observation
    end
  end
end
