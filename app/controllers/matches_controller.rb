# frozen_string_literal: true

class MatchesController < ApplicationController
  before_action :authenticate_user!

  def all
    @matches = Match.all.order(:started_at)
  end

  def upcoming
    @matches = Match.upcoming.order(:started_at)
  end
end
