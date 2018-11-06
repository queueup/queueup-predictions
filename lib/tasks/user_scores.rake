# frozen_string_literal: true

namespace :user_scores do
  desc 'TODO'
  task update: :environment do
    User.all.each do |user|
      score = 0
      user.predictions.each do |prediction|
        if prediction&.match&.ended?
          if prediction.perfect?
            score += 3
          elsif prediction.right?
            score += 1
          end
        end
      end
      user.update(score: score)
    end
  end
end
