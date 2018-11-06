# frozen_string_literal: true

class PredictionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @prediction = Prediction.where(
      user: current_user,
      match_id: prediction_params[:match_id]
    ).first_or_initialize
    @prediction.first_team_score = prediction_params[:first_team_score]
    @prediction.second_team_score = prediction_params[:second_team_score]
    @prediction.save

    respond_to do |format|
      format.js   {}
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  private

  def prediction_params
    params.require(:prediction).permit(:match_id, :first_team_score, :second_team_score)
  end
end
