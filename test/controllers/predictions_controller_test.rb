# frozen_string_literal: true

require 'test_helper'

class PredictionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prediction = predictions(:one)
  end

  test 'should get index' do
    get predictions_url
    assert_response :success
  end

  test 'should get new' do
    get new_prediction_url
    assert_response :success
  end

  test 'should create prediction' do
    assert_difference('Prediction.count') do
      post predictions_url, params: { prediction: { first_team_score: @prediction.first_team_score, match_id: @prediction.match_id, second_team_score: @prediction.second_team_score, user_id: @prediction.user_id } }
    end

    assert_redirected_to prediction_url(Prediction.last)
  end

  test 'should show prediction' do
    get prediction_url(@prediction)
    assert_response :success
  end

  test 'should get edit' do
    get edit_prediction_url(@prediction)
    assert_response :success
  end

  test 'should update prediction' do
    patch prediction_url(@prediction), params: { prediction: { first_team_score: @prediction.first_team_score, match_id: @prediction.match_id, second_team_score: @prediction.second_team_score, user_id: @prediction.user_id } }
    assert_redirected_to prediction_url(@prediction)
  end

  test 'should destroy prediction' do
    assert_difference('Prediction.count', -1) do
      delete prediction_url(@prediction)
    end

    assert_redirected_to predictions_url
  end
end
