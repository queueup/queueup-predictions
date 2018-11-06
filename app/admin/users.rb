# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :score

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
