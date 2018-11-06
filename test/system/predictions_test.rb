# frozen_string_literal: true

require 'application_system_test_case'

class PredictionsTest < ApplicationSystemTestCase
  setup do
    @prediction = predictions(:one)
  end

  test 'visiting the index' do
    visit predictions_url
    assert_selector 'h1', text: 'Predictions'
  end

  test 'creating a Prediction' do
    visit predictions_url
    click_on 'New Prediction'

    fill_in 'First Team Score', with: @prediction.first_team_score
    fill_in 'Match', with: @prediction.match_id
    fill_in 'Second Team Score', with: @prediction.second_team_score
    fill_in 'User', with: @prediction.user_id
    click_on 'Create Prediction'

    assert_text 'Prediction was successfully created'
    click_on 'Back'
  end

  test 'updating a Prediction' do
    visit predictions_url
    click_on 'Edit', match: :first

    fill_in 'First Team Score', with: @prediction.first_team_score
    fill_in 'Match', with: @prediction.match_id
    fill_in 'Second Team Score', with: @prediction.second_team_score
    fill_in 'User', with: @prediction.user_id
    click_on 'Update Prediction'

    assert_text 'Prediction was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Prediction' do
    visit predictions_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Prediction was successfully destroyed'
  end
end
