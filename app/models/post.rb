# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: true
  validates :body, presence: true
  belongs_to :user
  has_many :comment
<<<<<<< HEAD
end
=======
  end
>>>>>>> a434b67d3cc0716f53bc641aa1773d88689e373b
