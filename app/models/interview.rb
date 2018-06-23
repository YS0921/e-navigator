class Interview < ApplicationRecord
  belongs_to :user

  enum status: {pending: 0, approval: 1}

  validates :datetime, presence: true
end
