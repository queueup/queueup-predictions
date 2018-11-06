# frozen_string_literal: true

ActiveAdmin.register Team do
  permit_params :name, :acronym, :slug, :logo

  form partial: 'form'

  show do
    attributes_table do
      row :name
      row :acronym
      row :slug
      row :logo do |ad|
        image_tag url_for(ad.logo)
      end
    end
  end
end
