# frozen_string_literal: true

ActiveAdmin.register PilotRace do
  actions :index, :edit, :show, :update

  config.batch_actions = false
  config.filters = false

  menu false

  permit_params :pilot_id, :number

  form do |f|
    f.inputs do
      f.input :race, input_html: { disabled: true }
      f.input :pilot
      f.input :number
    end
    f.actions
  end

  show do
    attributes_table do
      row :race
      row :pilot
      row :number
    end
  end
end
