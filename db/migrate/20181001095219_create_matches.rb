# frozen_string_literal: true

class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :competition, index: true, foreign_key: true
      t.references :first_team, index: true, foreign_key: { to_table: :teams }
      t.integer :first_team_score, default: nil
      t.references :second_team, index: true, foreign_key: { to_table: :teams }
      t.integer :second_team_score, default: nil
      t.references :winner, index: true, foreign_key: { to_table: :teams }
      t.datetime :started_at

      t.timestamps
    end
  end
end
