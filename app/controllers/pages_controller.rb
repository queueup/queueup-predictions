# frozen_string_literal: true

class PagesController < ApplicationController
  def about; end

  def leaderboard
    @users = User.all.order(score: :desc)
  end

  def rules; end
end
