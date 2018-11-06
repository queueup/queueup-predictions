# frozen_string_literal: true

class CreateCompetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :competitions do |t|
      t.string :name
      t.string :slug
      t.boolean :current

      t.timestamps
    end
  end
end
