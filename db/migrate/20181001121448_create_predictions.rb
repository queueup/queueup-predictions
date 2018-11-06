# frozen_string_literal: true

class CreatePredictions < ActiveRecord::Migration[5.2]
  def change
    create_table :predictions do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :match, foreign_key: true
      t.integer :first_team_score
      t.integer :second_team_score

      t.timestamps
    end
  end
end
