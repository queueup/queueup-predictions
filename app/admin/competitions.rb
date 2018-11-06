# frozen_string_literal: true

ActiveAdmin.register Competition do
  permit_params :name, :current, :logo, :cover

  form partial: 'form'

  show do
    attributes_table do
      row :name
      row :current
      row :logo do |ad|
        image_tag url_for(ad.logo) if ad.logo.attached?
      end
      row :cover do |ad|
        image_tag url_for(ad.cover) if ad.cover.attached?
      end
    end
  end
end
