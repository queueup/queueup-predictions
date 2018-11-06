# frozen_string_literal: true

class Prediction < ApplicationRecord
  belongs_to :user
  belongs_to :match

  validate :locked_match

  def locked_match
    errors.add(:match, :locked) if match.locked?
  end

  def winning_team
    return if first_team_score.nil? || second_team_score.nil?

    return :first if first_team_score > second_team_score

    return :second if first_team_score < second_team_score

    :both
  end

  def right?
    winning_team == match.winning_team
  end

  def perfect?
    first_team_score == match.first_team_score &&
      second_team_score == match.second_team_score
  end
end
