class Interview < ApplicationRecord
  belongs_to :user

  enum status: {pending: 0, approval: 1, rejection: 2}

  validates :datetime, presence: true
end
