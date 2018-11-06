# frozen_string_literal: true

class AddDefaultToPredictions < ActiveRecord::Migration[5.2]
  def up
    Prediction.all.each do |prediction|
      prediction.first_team_score = 0 if prediction.first_team_score.nil?
      prediction.second_team_score = 0 if prediction.second_team_score.nil?
      prediction.save(validate: false)
    end
    change_column :predictions, :first_team_score, :integer, default: 0, null: false
    change_column :predictions, :second_team_score, :integer, default: 0, null: false
  end

  def down
    change_column :predictions, :first_team_score, :integer, default: nil
    change_column :predictions, :second_team_score, :integer, default: nil
  end
end
