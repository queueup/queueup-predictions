# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend FriendlyId

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  friendly_id :username, use: :slugged

  validates :username, presence: true, uniqueness: true

  has_many :predictions
end
