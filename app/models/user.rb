# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4, maximum: 16 },
                   uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
