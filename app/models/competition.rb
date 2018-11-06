# frozen_string_literal: true

class Competition < ApplicationRecord
  has_one_attached :logo
  has_one_attached :cover
end
