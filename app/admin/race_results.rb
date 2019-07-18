# frozen_string_literal: true

ActiveAdmin.register RaceResult do
  actions :index, :edit, :show, :update

  config.batch_actions = false
  config.filters = false

  menu false

  permit_params :score_for_champ

  form do |f|
    f.inputs 'Stear puntaje para Campeonato' do
      f.input :race, input_html: { disabled: true }
      f.input :pilot_race, input_html: { disabled: true }
      f.input :position, input_html: { disabled: true }
      f.input :score, input_html: { disabled: true }
      f.input :score_for_champ
    end
    f.actions
  end

  show title: 'Resultado fecha piloto' do
    attributes_table do
      row :race
      row :pilot_race
      row :position
      row :score
      row :score_for_champ
    end
  end
end
