# frozen_string_literal: true

ActiveAdmin.register Match do
  permit_params :competition_id,
                :first_team_id,
                :first_team_score,
                :second_team_id,
                :second_team_score,
                :winner_id,
                :started_at,
                :match_type

  action_item :update_matches_button, only: :index do
    link_to 'Mettre à jour les matches', action: 'update_matches'
  end

  collection_action :update_matches, method: :get do
    render 'admin/matches/update_matches'
  end

  collection_action :import_matches, method: :post do
    CSV.foreach(params[:dump][:file].path, headers: true) do |csv_match|
      match = Match.where(
        competition: Competition.find_by(current: true),
        started_at: Time.zone.strptime(
          "#{csv_match['date']} #{csv_match['time']}",
          '%m/%d/%Y %H:%M'
        )
      ).first_or_initialize
      first_team_acronym = csv_match['first_team'].blank? ? 'TBD' : csv_match['first_team']
      second_team_acronym = csv_match['second_team'].blank? ? 'TBD' : csv_match['second_team']
      match.first_team = Team.find_by(acronym: first_team_acronym)
      match.second_team = Team.find_by(acronym: second_team_acronym)
      match.match_type = csv_match['match_type']
      match.first_team_score = csv_match['first_team_score']
      match.second_team_score = csv_match['second_team_score']
      match.winning_team
      match.save!
    end
    redirect_to action: :index, notice: 'Mise à jour terminée !'
  end
end
