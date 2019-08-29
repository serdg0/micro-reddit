# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :comment, presence: true
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :post, foreign_key: 'post_id'
end
