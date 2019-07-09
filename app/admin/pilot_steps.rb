ActiveAdmin.register PilotStep do
  actions :index, :edit, :show, :update

  config.batch_actions = false
  config.filters = false

  menu false

  permit_params :position, :time, :score

  form do |f|
    f.inputs do
      f.input :step, input_html: { disabled: true }
      f.input :pilot, input_html: { disabled: true }
      f.input :time
      f.input :position
      f.input :score
    end
    f.actions
  end

  show do
    attributes_table do
      row :step
      row :pilot
      row :time
      row :position
      row :score
    end
  end
end
