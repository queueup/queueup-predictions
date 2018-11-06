# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :competition, optional: false
  belongs_to :first_team, class_name: 'Team', optional: true
  belongs_to :second_team, class_name: 'Team', optional: true
  belongs_to :winner, class_name: 'Team', optional: true

  has_many :predictions, dependent: :destroy

  enum match_type: %i[bo1 bo3 bo5]

  scope :upcoming, -> {
    where('started_at > ?', Time.zone.now.beginning_of_day)
  }

  def winning_team
    return if first_team_score.nil? || second_team_score.nil?

    if first_team_score > second_team_score
      self.winner = first_team
      return :first
    elsif first_team_score < second_team_score
      self.winner = second_team
      return :second
    else
      return :both
    end
  end

  def locked?
    Time.zone.now > started_at - 30.minutes
  end

  def ended?
    !first_team_score.nil? && !second_team_score.nil?
  end
end
