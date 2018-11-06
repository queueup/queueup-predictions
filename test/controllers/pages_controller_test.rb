# frozen_string_literal: true

require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get leaderboard' do
    get pages_leaderboard_url
    assert_response :success
  end
end
