# frozen_string_literal: true

module MatchesHelper
  def match_type(match)
    puts match
    case match
    when 'bo1'
      'Best-of 1'
    when 'bo3'
      'Best-of 3'
    when 'bo5'
      'Best-of 5'
    end
  end
end
