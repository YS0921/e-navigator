class Interview < ApplicationRecord
  belongs_to :user

  enum status: {pending: 0, approval: 1, rejection: 2}

  validates :datetime, presence: true

  def datetime_print
    self.datetime.strftime("%Y年%m月%d日  %H時%M分")
  end
end
